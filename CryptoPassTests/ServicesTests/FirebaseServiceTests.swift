//
//  FirebaseServiceTests.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import XCTest
@testable import CryptoPass
import FirebaseFirestore

class FirebaseServiceTests: XCTestCase {
    var firebaseService: FirebaseService!

    override func setUp() {
        super.setUp()
        firebaseService = FirebaseService()
    }

    override func tearDown() {
        firebaseService = nil
        super.tearDown()
    }

    func testSavePassword() {
        let password = PasswordModel(
            id: UUID(),
            serviceName: "TestService",
            username: "testUser",
            encryptedPassword: "encrypted123",
            category: .other
        )
        
        firebaseService.savePassword(password)
    }
}
