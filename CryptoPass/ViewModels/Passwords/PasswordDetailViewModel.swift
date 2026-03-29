//
//  PasswordDetailViewModel.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//

import Foundation

class PasswordDetailViewModel: ObservableObject {
    @Published var serviceName: String
    @Published var username: String
    @Published var decryptedPassword: String
    @Published var category: PasswordCategory

    private let encryptionService = EncryptionService()
    private let passwordStorage = PasswordStorage()

    init(password: PasswordModel) {
        self.serviceName = password.serviceName
        self.username = password.username
        self.category = password.category

        do {
            self.decryptedPassword = try encryptionService.decrypt(password.encryptedPassword)
        } catch {
            self.decryptedPassword = "Failed to decrypt password"
            print("Decryption error: \(error.localizedDescription)")
        }
    }

    func updatePassword(newPassword: String) {
        do {
            let encryptedPassword = try encryptionService.encrypt(newPassword)
            passwordStorage.updatePassword(
                id: UUID(),
                newEncryptedPassword: encryptedPassword
            )
            print("Password updated successfully!")
        } catch {
            print("Failed to encrypt new password: \(error.localizedDescription)")
        }
    }
}
