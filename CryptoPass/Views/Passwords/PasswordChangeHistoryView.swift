//
//  PasswordChangeHistoryView.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import SwiftUI

struct PasswordChangeHistoryView: View {
    var passwordID: UUID

    var body: some View {
        VStack {
            Text("Change History")
                .font(.largeTitle)
                .padding()

            Text("Password ID: \(passwordID.uuidString)")
                .font(.subheadline)
                .padding()

            List {
                Text("Old password: abc123 → New password: def456")
                Text("Old password: def456 → New password: ghi789")
            }
        }
        .navigationTitle("Change History")
        .padding()
    }
}
