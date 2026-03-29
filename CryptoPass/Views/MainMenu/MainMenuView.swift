//
//  MainMenuView.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 23.12.24.
//


import SwiftUI

struct MainMenuView: View {
    var body: some View {
        VStack {
            Text("Main Menu")
                .font(.largeTitle)
                .padding()

            NavigationLink(destination: PasswordListView()) {
                Text("View Passwords")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()

            NavigationLink(destination: AddPasswordView()) {
                Text("Add Password")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
    }
}
