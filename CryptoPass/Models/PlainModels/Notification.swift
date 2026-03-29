//
//  Notification.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import Foundation

struct Notification: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var message: String
    var scheduledDate: Date
    var isRead: Bool = false
}
