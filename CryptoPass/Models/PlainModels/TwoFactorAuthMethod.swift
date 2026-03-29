//
//  TwoFactorAuthMethod.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import Foundation

enum TwoFactorAuthMethod: String, Codable {
    case sms = "SMS"
    case email = "Email"
    case authenticatorApp = "Authenticator App"
}

struct TwoFactorAuth: Codable {
    var isEnabled: Bool = false
    var method: TwoFactorAuthMethod?
    var phoneNumber: String?
    var email: String?
}
