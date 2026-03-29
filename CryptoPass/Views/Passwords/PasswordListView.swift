//
//  Password.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 23.12.24.
//


import SwiftUI

struct PasswordListView: View {
    @State private var passwords: [PasswordModel] = [
        PasswordModel(serviceName: "Gmail", username: "user@gmail.com", encryptedPassword: "abc123", category: .personal),
        PasswordModel(serviceName: "Facebook", username: "user@facebook.com", encryptedPassword: "def456", category: .social)
    ]

    var body: some View {
        NavigationView {
            List(passwords) { password in
                NavigationLink(destination: PasswordChangeHistoryView(passwordID: password.id)) {
                    VStack(alignment: .leading) {
                        Text(password.serviceName)
                            .font(.headline)
                        Text(password.username)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("Category: \(password.category.rawValue)")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationTitle("Saved Passwords")
        }
    }
}
