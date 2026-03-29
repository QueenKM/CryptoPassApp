//
//  CryptoPassUITests.swift
//  CryptoPassUITests
//
//  Created by Kristina Mateva on 23.12.24.
//

import XCTest

final class CryptoPassUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLoginFlow() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.textFields["Email"].exists, "Email text field not found")
        XCTAssertTrue(app.secureTextFields["Password"].exists, "Password text field not found")
        XCTAssertTrue(app.buttons["Login"].exists, "Login button not found")
        
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("test@example.com")
        
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("ValidPassword123")
        
        app.buttons["Login"].tap()
        
        XCTAssertTrue(app.staticTexts["Main Menu"].exists, "Failed to navigate to Main Menu")
    }

    func testAddPasswordFlow() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.buttons["Add Password"].exists, "Add Password button not found")
        
        app.buttons["Add Password"].tap()
        
        let serviceNameField = app.textFields["Service Name"]
        serviceNameField.tap()
        serviceNameField.typeText("Gmail")
        
        let usernameField = app.textFields["Username"]
        usernameField.tap()
        usernameField.typeText("user@gmail.com")
        
        let passwordField = app.secureTextFields["Password"]
        passwordField.tap()
        passwordField.typeText("StrongPassword123")
        
        app.buttons["Save Password"].tap()
        
        XCTAssertTrue(app.staticTexts["Password saved successfully!"].exists, "Password save confirmation not found")
    }
}
