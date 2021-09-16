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
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
           
        sut = storyboard.instantiateViewController(withIdentifier: "register") as? RegisterViewController
        sut.loadViewIfNeeded()
  //      sut.beginAppearanceTransition(true, animated: false)
        sut.emailAddress.text = "1@2.com"
    }

    override func tearDownWithError() throws {
        
        sut.endAppearanceTransition()
        sut = nil
    }

    func testRegisterForm_WhenLoaded_TextFieldAreConnected() throws {
     _ = try XCTUnwrap(sut.emailAddress, "Email address UITextField is not connected")
     _ = try XCTUnwrap(sut.name, "Name UITextField is not connected")
     _ = try XCTUnwrap(sut.phoneNumber, "Phone number UITextField is not connected")
     _ = try XCTUnwrap(sut.password, "Password UITextField is not connected")
     _ = try XCTUnwrap(sut.reenterPassword, "Reenter password UITextField is not connected")
    }
    
    func testEmailTextField_WhenCreated_HasEmailAddressContentType_And_EmailKeyboardTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.emailAddress, "Email address UITextField is not connected")
        
        XCTAssertEqual(emailTextField.textContentType, UITextContentType.emailAddress, "Email address UITextField does not have an Email Address Content Type set")
        
        XCTAssertEqual(emailTextField.keyboardType, UIKeyboardType.emailAddress, "Email Address UITextField does not have Email Keyboard type set")
        
//        XCTAssertNotEqual(emailTextField.text, "", "Email UITextField is not empty")
    }
    
    func testNameTextField_WhenCreated_HasNameContentType_And_AutoCapitalizationSet() throws {
        let nameTextField = try XCTUnwrap(sut.name, "Name UITextField is not connected")
        
        XCTAssertEqual(nameTextField.textContentType, UITextContentType.name, "Name UITextField does not have an Name Content Type set")
        
        XCTAssertEqual(nameTextField.autocapitalizationType, UITextAutocapitalizationType.words, "Name UITextField does not captitalize each word")
    }
    
    func testPhoneNumberTextField_WhenCreated_HasTelephoneNumberContentType_And_PhonePadKeyboardTypeSet() throws {
        let numberTextField = try XCTUnwrap(sut.phoneNumber, "Name UITextField is not connected")
        
        XCTAssertEqual(numberTextField.textContentType, UITextContentType.telephoneNumber, "Phone number UITextField does not have an Telephone Number Content Type set")
        
        XCTAssertEqual(numberTextField.keyboardType, UIKeyboardType.phonePad, "Phone Number UITextField does not have Phone Pad keyboard type")
    }
    
    func testPasswordTextField_WhenCreated_IsSecureTextEntryField_And_HasPasswordContentTypeSet () throws {
        let passwordTextField = try XCTUnwrap(sut.password, "The Password UITextField is not connected")
        
        XCTAssertTrue(passwordTextField.isSecureTextEntry, "Password UITextField is not a Secure Text Entry Field")
        
        XCTAssertEqual(passwordTextField.textContentType, UITextContentType.password, "Password UITextField does not have an Password Content Type set")
    }
    
    func testReenterPasswordTextField_WhenCreated_IsSecureTextEntryField_And_HasPasswordContentTypeSet () throws {
        
        let reenterPasswordTextField = try XCTUnwrap(sut.reenterPassword, "The Re-enter Password UITextField is not connected")
        
        XCTAssertTrue(reenterPasswordTextField.isSecureTextEntry, "Re-enter Password UITextField is not a Secure Text Entry Field")
        
        XCTAssertEqual(reenterPasswordTextField.textContentType, UITextContentType.password, "Re-enter Password UITextField does not have an Password Content Type set")
    }
}
