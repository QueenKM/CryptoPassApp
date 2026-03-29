//
//  ErrorHandler.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


class ErrorHandler {
    func handle(_ error: Error) -> String {
        return "Error: \(error.localizedDescription)"
    }

    func showErrorAlert(for error: Error) {
        print("Displaying alert: \(error.localizedDescription)")
    }
}
