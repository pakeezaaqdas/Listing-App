//
//  LoginViewControllerTest.swift
//  Listing Tests
//
//  Created by Pakeeza Aqdas on 17/09/2021.
//

@testable import Listing
import XCTest

class LoginViewControllerTest: XCTestCase {

    var sut: LoginViewController!

    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
           
        sut = storyboard.instantiateViewController(withIdentifier: "Login") as? LoginViewController
        sut.loadViewIfNeeded()
        
        sut.email.text = "1@2.com"
        sut.password.text = "testing"
 
    }

    override func tearDownWithError() throws {
        
        sut.endAppearanceTransition()
        sut = nil
        
        try super.tearDownWithError()
    }
    
//    func testLoginForm_WhenLoaded_TextFieldAreConnected() throws {
//     _ = try XCTUnwrap(sut.email)
//     _ = try XCTUnwrap(sut.password)
//    }

    func testEmailTextField_WhenCreated_HasEmailAddressContentType_And_EmailKeyboardTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.email)
        
        XCTAssertEqual(emailTextField.textContentType, UITextContentType.emailAddress)
        
        XCTAssertEqual(emailTextField.keyboardType, UIKeyboardType.emailAddress)
        
        XCTAssertNotEqual(emailTextField.text, "")
    }
    
    func testPasswordTextField_WhenCreated_IsSecureTextEntryField_And_HasPasswordContentTypeSet () throws {
        let passwordTextField = try XCTUnwrap(sut.password)
        
        XCTAssertTrue(passwordTextField.isSecureTextEntry)
        
        XCTAssertEqual(passwordTextField.textContentType, UITextContentType.password)
        
        XCTAssertNotEqual(passwordTextField.text, "")
    }
    
    func testLoginContinueBtnVerify()
    {
        XCTAssertNotNil(sut.loginContinueButton)
    }
    
    func testRegisterBtnVerify()
    {
        XCTAssertNotNil(sut.goToRegisterButton)
    }

}
