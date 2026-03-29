//
//  EncryptionService.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//

import Foundation
import CryptoKit

class EncryptionService {
    private let key: SymmetricKey

    init() {
        if let savedKeyData = KeychainHelper.loadData(for: "encryptionKey") {
            self.key = SymmetricKey(data: savedKeyData)
        } else {
            let newKey = SymmetricKey(size: .bits256)
            KeychainHelper.saveData(newKey.withUnsafeBytes { Data($0) }, for: "encryptionKey")
            self.key = newKey
        }
    }

    func encrypt(_ plaintext: String) throws -> String {
        guard let data = plaintext.data(using: .utf8) else {
            throw EncryptionError.invalidInput("Input text cannot be converted to data.")
        }
        let sealedBox = try AES.GCM.seal(data, using: key)
        guard let combinedData = sealedBox.combined else {
            throw EncryptionError.encryptionFailed("Failed to combine encrypted data.")
        }
        return combinedData.base64EncodedString()
    }

    func decrypt(_ base64String: String) throws -> String {
        guard let data = Data(base64Encoded: base64String) else {
            throw EncryptionError.invalidInput("Invalid Base64 string.")
        }
        let sealedBox = try AES.GCM.SealedBox(combined: data)
        let decryptedData = try AES.GCM.open(sealedBox, using: key)
        guard let decryptedString = String(data: decryptedData, encoding: .utf8) else {
            throw EncryptionError.decryptionFailed("Decrypted data cannot be converted to string.")
        }
        return decryptedString
    }
}

enum EncryptionError: Error, LocalizedError {
    case invalidInput(String)
    case encryptionFailed(String)
    case decryptionFailed(String)

    var errorDescription: String? {
        switch self {
        case .invalidInput(let message), .encryptionFailed(let message), .decryptionFailed(let message):
            return message
        }
    }
}

class KeychainHelper {
    static func saveData(_ data: Data, for key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }

    static func loadData(for key: String) -> Data? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        if status == errSecSuccess {
            return dataTypeRef as? Data
        }
        return nil
    }
}
