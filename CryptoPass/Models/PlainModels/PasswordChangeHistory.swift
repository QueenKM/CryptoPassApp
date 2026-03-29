//
//  PasswordChangeHistory.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import Foundation

struct PasswordChangeHistoryModel: Identifiable, Codable {
    var id: UUID = UUID()
    var passwordID: UUID
    var oldPassword: String
    var newPassword: String
    var changeDate: Date = Date()
}
