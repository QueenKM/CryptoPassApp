//
//  AddPasswordViewModel.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//

import SwiftUI

struct AddPasswordView: View {
    @StateObject private var viewModel = AddPasswordViewModel()

    var body: some View {
        VStack {
            TextField("Service Name", text: $viewModel.serviceName)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)

            TextField("Username", text: $viewModel.username)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)

            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)

            Picker("Category", selection: $viewModel.selectedCategory) {
                ForEach(PasswordCategory.allCases, id: \.self) { category in
                    Text(category.rawValue).tag(category)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)

            Button("Save Password") {
                viewModel.savePassword()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)

            if !viewModel.successMessage.isEmpty || !viewModel.errorMessage.isEmpty {
                Text(!viewModel.successMessage.isEmpty ? viewModel.successMessage : viewModel.errorMessage)
                    .foregroundColor(!viewModel.successMessage.isEmpty ? .green : .red)
                    .padding()
            }
        }
        .padding()
    }
}
