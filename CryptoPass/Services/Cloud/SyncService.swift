//
//  SyncService.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//

import Foundation

class SyncService {
    private let passwordStorage = PasswordStorage()

    func syncPasswords() {
        let passwords = passwordStorage.loadAll()
        
        for password in passwords {
            print("Syncing password for service: \(password.serviceName)")
        }
    }
}
