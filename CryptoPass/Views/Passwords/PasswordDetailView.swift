//
//  PasswordDetailView.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import SwiftUI

struct PasswordDetailView: View {
    let password: PasswordModel

    var body: some View {
        VStack {
            Text("Service: \(password.serviceName)")
                .font(.headline)
            Text("Username: \(password.username)")
                .font(.subheadline)
            Text("Category: \(password.category.rawValue)")
                .font(.subheadline)
            Text("Encrypted Password: \(password.encryptedPassword)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .navigationTitle("Password Details")
    }
}
