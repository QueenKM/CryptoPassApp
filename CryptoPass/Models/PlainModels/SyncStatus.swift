//
//  SyncStatus.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import Foundation

enum SyncStatus: String, Codable {
    case notSynced = "Not Synced"
    case syncing = "Syncing"
    case synced = "Synced"
}

struct SyncData: Codable {
    var lastSyncDate: Date?
    var status: SyncStatus = .notSynced
}
