//
//  ErrorViewModel.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import Foundation

class ErrorViewModel: ObservableObject {
    @Published var errorMessage: String?

    func handleError(_ error: Error) {
        self.errorMessage = error.localizedDescription
    }
}
