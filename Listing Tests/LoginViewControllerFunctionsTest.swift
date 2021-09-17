//
//  LoginViewControllerFunctionsTest.swift
//  Listing Tests
//
//  Created by Pakeeza Aqdas on 17/09/2021.
//

@testable import Listing
import XCTest

class LoginViewControllerFunctionsTest: XCTestCase {

    var sut: LoginViewController!

    override func setUpWithError() throws {
        
        try super.setUpWithError()
        sut = LoginViewController()
        sut.loadViewIfNeeded()
        sut.beginAppearanceTransition(true, animated: false)
    }

    override func tearDownWithError() throws {
        
        sut.endAppearanceTransition()
        sut = nil
        try super.tearDownWithError()
    }
    
    func testCreateAlertBox() {
    
        sut.createAlertBox(message: "Error")
    }
}
