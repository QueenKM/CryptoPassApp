//
//  AddPasswordViewModel.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//

import Foundation

class AddPasswordViewModel: ObservableObject {
    @Published var serviceName: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var selectedCategory: PasswordCategory = .other
    @Published var successMessage: String = ""
    @Published var errorMessage: String = ""

    private let encryptionService = EncryptionService()
    private let passwordStorage = PasswordStorage()

    func savePassword() {
        guard !serviceName.isEmpty, !username.isEmpty, !password.isEmpty else {
            errorMessage = "All fields are required."
            successMessage = ""
            return
        }

        guard password.count >= 8 else {
            errorMessage = "Password must be at least 8 characters long."
            successMessage = ""
            return
        }

        do {
            let encryptedPassword = try encryptionService.encrypt(password)

            let newPassword = PasswordModel(
                serviceName: serviceName,
                username: username,
                encryptedPassword: encryptedPassword,
                category: selectedCategory
            )

            passwordStorage.save(passwordModel: newPassword)
            successMessage = "Password saved successfully!"
            errorMessage = ""
        } catch {
            errorMessage = "Failed to save password: \(error.localizedDescription)"
            successMessage = ""
        }
    }
}
