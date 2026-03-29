//
//  LoginViewModelTests.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import XCTest
@testable import CryptoPass

class LoginViewModelTests: XCTestCase {
    var loginViewModel: AuthenticationViewModel!

    override func setUp() {
        super.setUp()
        loginViewModel = AuthenticationViewModel()
    }

    override func tearDown() {
        loginViewModel = nil
        super.tearDown()
    }

    func testLoginSuccess() {
        loginViewModel.email = "test@example.com"
        loginViewModel.password = "ValidPassword123"
        
        let expectation = self.expectation(description: "Login should succeed")
        
        loginViewModel.login { success in
            XCTAssertTrue(success, "Login failed with valid credentials")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testLoginFailure() {
        loginViewModel.email = "invalid@example.com"
        loginViewModel.password = "InvalidPassword"
        
        let expectation = self.expectation(description: "Login should fail")
        
        loginViewModel.login { success in
            XCTAssertFalse(success, "Login succeeded with invalid credentials")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
