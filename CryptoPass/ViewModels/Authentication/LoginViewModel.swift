//
//  LoginViewModel.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var errorMessage: String?

    func loginWith2FA(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                if let user = authResult?.user, user.isEmailVerified == false {
                    self.sendVerificationEmail(user: user)
                }
            }
        }
    }

    private func sendVerificationEmail(user: User) {
        user.sendEmailVerification { error in
            if let error = error {
                self.errorMessage = "Failed to send verification email: \(error.localizedDescription)"
            } else {
                self.errorMessage = "Verification email sent. Please check your inbox."
            }
        }
    }
}
