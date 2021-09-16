//
//  RegisterViewControllerFunctionsTests.swift
//  Listing Tests
//
//  Created by Pakeeza Aqdas on 16/09/2021.
//

@testable import Listing
import XCTest

class RegisterViewControllerFunctionsTests: XCTestCase {
    
    var sut: RegisterViewController!

    override func setUpWithError() throws {
        sut = RegisterViewController()
        sut.loadViewIfNeeded()
        sut.beginAppearanceTransition(true, animated: false)
    }

    override func tearDownWithError() throws {
        
        sut.endAppearanceTransition()
        sut = nil
    }

    func testPasswordAndReeneterPasswordAreNotEqual() {
        
        XCTAssertTrue(sut.passwordAndReenterPasswordAreNotEqual(password: "qwerty", reenterPassword: "qwertu"), "Password and Reenter Password are equal")
        
        XCTAssertFalse(sut.passwordAndReenterPasswordAreNotEqual(password: "qwerty", reenterPassword: "qwerty"), "Password and Reenter Password are not equal")
    }
    
    func testCreateAlertBox() {
    
        sut.createAlertBox(message: "Error")
    }

}


/*REGISTER AND REGISTER BUTTON PRESSED LEFT TO TEST*/
