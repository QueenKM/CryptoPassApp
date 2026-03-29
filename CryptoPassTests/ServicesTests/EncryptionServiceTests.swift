//
//  EncryptionServiceTests.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import XCTest
@testable import CryptoPass

class EncryptionServiceTests: XCTestCase {
    var encryptionService: EncryptionService!

    override func setUp() {
        super.setUp()
        encryptionService = EncryptionService()
    }

    override func tearDown() {
        encryptionService = nil
        super.tearDown()
    }

    func testEncryptDecrypt() throws {
        let originalText = "TestPassword123"
        let encryptedText = try encryptionService.encrypt(originalText)
        XCTAssertNotNil(encryptedText, "Encryption failed, got nil")
        let decryptedText = try encryptionService.decrypt(encryptedText)
        XCTAssertEqual(originalText, decryptedText, "Decrypted text does not match original")
    }
}
