//
//  CryptoPassTests.swift
//  CryptoPassTests
//
//  Created by Kristina Mateva on 23.12.24.
//

import XCTest
@testable import CryptoPass

class CryptoPassTests: XCTestCase {
    func testAppInitialization() {
        XCTAssertNotNil(CryptoPassApp(), "CryptoPassApp failed to initialize")
    }

    func testGeneralUtilityFunction() {
        let result = Utility.someGeneralFunction()
        XCTAssertEqual(result, "ExpectedResult", "Utility function did not return expected result")
    }
}
