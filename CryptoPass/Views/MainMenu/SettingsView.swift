//
//  SettingsView.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
            Section(header: Text("Account")) {
                Text("Email: user@example.com")
                Toggle("Enable Biometric Authentication", isOn: .constant(true))
            }
            Section(header: Text("Application")) {
                Button("Clear All Data") {
                    print("Clear data tapped")
                }
                .foregroundColor(.red)
            }
        }
        .navigationTitle("Settings")
    }
}
