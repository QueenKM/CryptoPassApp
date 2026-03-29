//
//  Password.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//

import Foundation

struct PasswordModel: Identifiable, Codable {
    var id: UUID = UUID()
    var serviceName: String
    var username: String
    var encryptedPassword: String
    var category: PasswordCategory
    var createdDate: Date = Date()
    var notes: String?
}
