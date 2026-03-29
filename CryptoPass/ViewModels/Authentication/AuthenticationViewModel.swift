//
//  AuthenticationViewModel.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import Foundation
import FirebaseAuth

class AuthenticationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?

    func login(completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                completion(false)
            } else {
                completion(true)
            }
        }
    }

    func register(completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}
