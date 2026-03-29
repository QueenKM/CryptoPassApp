//
//  UserProfile.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import Foundation

struct UserProfileModel: Codable {
    var id: UUID = UUID()
    var email: String
    var name: String?
    var profilePictureURL: String?
    var isPremiumUser: Bool = false
}
