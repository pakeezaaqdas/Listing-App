//
//  RegisterViewControllerTests.swift
//  Listing Tests
//
//  Created by Pakeeza Aqdas on 16/09/2021.
//

@testable import Listing
import XCTest

class RegisterViewControllerTests: XCTestCase {
    
    var sut: RegisterViewController!

    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
           
        sut = storyboard.instantiateViewController(withIdentifier: "register") as? RegisterViewController
        sut.loadViewIfNeeded()

        sut.emailAddress.text = "1@2.com"
        sut.name.text = "Test"
        sut.phoneNumber.text = "03361234567"
        sut.password.text = "testing"
        sut.reenterPassword.text = "testing"
    }

    override func tearDownWithError() throws {
        
        sut.endAppearanceTransition()
        sut = nil
        try super.tearDownWithError()
    }
    
    func testEmailTextField_WhenCreated_HasEmailAddressContentType_And_EmailKeyboardTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.emailAddress)
        
        XCTAssertEqual(emailTextField.textContentType, UITextContentType.emailAddress)
        
        XCTAssertEqual(emailTextField.keyboardType, UIKeyboardType.emailAddress)
        
        XCTAssertNotEqual(emailTextField.text, "")
    }
    
    func testNameTextField_WhenCreated_HasNameContentType_And_AutoCapitalizationSet() throws {
        let nameTextField = try XCTUnwrap(sut.name)
        
        XCTAssertEqual(nameTextField.textContentType, UITextContentType.name)
        
        XCTAssertEqual(nameTextField.autocapitalizationType, UITextAutocapitalizationType.words)
        
        XCTAssertNotEqual(nameTextField.text, "")
    }
    
    func testPhoneNumberTextField_WhenCreated_HasTelephoneNumberContentType_And_PhonePadKeyboardTypeSet() throws {
        let numberTextField = try XCTUnwrap(sut.phoneNumber)
        
        XCTAssertEqual(numberTextField.textContentType, UITextContentType.telephoneNumber)
        
        XCTAssertEqual(numberTextField.keyboardType, UIKeyboardType.phonePad)
        
        XCTAssertNotEqual(numberTextField.text, "")

    }
    
    func testPasswordTextField_WhenCreated_IsSecureTextEntryField_And_HasPasswordContentTypeSet () throws {
        let passwordTextField = try XCTUnwrap(sut.password)
        
        XCTAssertTrue(passwordTextField.isSecureTextEntry)
        
        XCTAssertEqual(passwordTextField.textContentType, UITextContentType.password)
        
        XCTAssertNotEqual(passwordTextField.text, "")

    }
    
    func testReenterPasswordTextField_WhenCreated_IsSecureTextEntryField_And_HasPasswordContentTypeSet () throws {
        
        let reenterPasswordTextField = try XCTUnwrap(sut.reenterPassword)
        
        XCTAssertTrue(reenterPasswordTextField.isSecureTextEntry)
        
        XCTAssertEqual(reenterPasswordTextField.textContentType, UITextContentType.password)
        
        XCTAssertNotEqual(reenterPasswordTextField.text, "")

    }
    
    func testRegisterContinueBtnVerify()
    {
        XCTAssertNotNil(sut.registerContinueButton)
    }
    
    //MARK: - view controller
    
    func testPasswordAndReeneterPasswordAreNotEqual() {
        
        XCTAssertTrue(sut.passwordAndReenterPasswordAreNotEqual(password: "qwerty", reenterPassword: "qwertu"))
        
        XCTAssertFalse(sut.passwordAndReenterPasswordAreNotEqual(password: "qwerty", reenterPassword: "qwerty"))
    }
    
    func testCreateAlertBox() {
    
        sut.createAlertBox(message: "Error")
    }

    
}
