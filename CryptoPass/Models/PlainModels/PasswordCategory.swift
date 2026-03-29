//
//  PasswordCategory.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import Foundation

enum PasswordCategory: String, Codable, CaseIterable {
    case work = "Work"
    case personal = "Personal"
    case social = "Social"
    case banking = "Banking"
    case other = "Other"
}
