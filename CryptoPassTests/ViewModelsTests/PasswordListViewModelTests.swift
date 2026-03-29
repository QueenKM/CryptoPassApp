//
//  PasswordListViewModelTests.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import XCTest
@testable import CryptoPass

class PasswordListViewModelTests: XCTestCase {
    var viewModel: PasswordListViewModel!

    override func setUp() {
        super.setUp()
        viewModel = PasswordListViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testFetchPasswords() {
        viewModel.fetchPasswords()
        
        XCTAssertFalse(viewModel.passwords.isEmpty, "Passwords list is empty after fetch")
    }
}
