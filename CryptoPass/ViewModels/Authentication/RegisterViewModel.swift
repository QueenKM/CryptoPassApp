//
//  RegisterViewModel.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import Foundation
import FirebaseAuth

class RegisterViewModel: ObservableObject {
    @Published var errorMessage: String?

    func register(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
