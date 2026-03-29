//
//  SyncViewModel.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import Foundation

class SyncViewModel: ObservableObject {
    @Published var isSyncing: Bool = false
    private let syncService = SyncService()

    func syncPasswords() {
        isSyncing = true
        syncService.syncPasswords()
        isSyncing = false
    }
}
