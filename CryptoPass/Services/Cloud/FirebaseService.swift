//
//  FirebaseService.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import Foundation
import FirebaseFirestore

class FirebaseService {
    private let db = Firestore.firestore()

    func savePassword(_ password: PasswordModel) {
        let data: [String: Any] = [
            "id": password.id.uuidString,
            "serviceName": password.serviceName,
            "username": password.username,
            "encryptedPassword": password.encryptedPassword,
            "category": password.category.rawValue
        ]
        db.collection("passwords").document(password.id.uuidString).setData(data) { error in
            if let error = error {
                print("Failed to save password: \(error.localizedDescription)")
            } else {
                print("Password saved successfully.")
            }
        }
    }

    func fetchPasswords(completion: @escaping ([PasswordModel]) -> Void) {
        db.collection("passwords").getDocuments { snapshot, error in
            if let error = error {
                print("Failed to fetch passwords: \(error.localizedDescription)")
                completion([])
            } else {
                let passwords = snapshot?.documents.compactMap { document -> PasswordModel? in
                    guard let data = document.data() as? [String: String],
                          let id = UUID(uuidString: data["id"] ?? ""),
                          let serviceName = data["serviceName"],
                          let username = data["username"],
                          let encryptedPassword = data["encryptedPassword"],
                          let categoryRawValue = data["category"],
                          let category = PasswordCategory(rawValue: categoryRawValue) else {
                        return nil
                    }
                    return PasswordModel(id: id, serviceName: serviceName, username: username, encryptedPassword: encryptedPassword, category: category)
                } ?? []
                completion(passwords)
            }
        }
    }
}
