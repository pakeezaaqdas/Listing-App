//
//  EditProfileViewControllerTest.swift
//  Listing Tests
//
//  Created by Pakeeza Aqdas on 17/09/2021.
//

@testable import Listing
import XCTest

class EditProfileViewControllerTest: XCTestCase {

    var sut: EditProfileViewController!

    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
           
        sut = storyboard.instantiateViewController(withIdentifier: "editProfile") as? EditProfileViewController
        sut.loadViewIfNeeded()
        
        sut.nameTextField.text = "Test"
        sut.numberTextField.text = "03361234567"
    }

    override func tearDownWithError() throws {
        
        sut.endAppearanceTransition()
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testNameTextField_WhenCreated_HasNameContentType_And_AutoCapitalizationSet() throws {
        let nameTextField = try XCTUnwrap(sut.nameTextField)
        
        XCTAssertEqual(nameTextField.textContentType, UITextContentType.name)
        
        XCTAssertEqual(nameTextField.autocapitalizationType, UITextAutocapitalizationType.words)
        
        XCTAssertNotEqual(nameTextField.text, "")
    }
    
    func testPhoneNumberTextField_WhenCreated_HasTelephoneNumberContentType_And_PhonePadKeyboardTypeSet() throws {
        let numberTextField = try XCTUnwrap(sut.numberTextField)
        
        XCTAssertEqual(numberTextField.textContentType, UITextContentType.telephoneNumber)
        
        XCTAssertEqual(numberTextField.keyboardType, UIKeyboardType.phonePad)
        
        XCTAssertNotEqual(numberTextField.text, "")

    }
    
    //MARK: - view controller
    
    func testSaveBtnVerify()
    {
        XCTAssertNotNil(sut.saveButton)
    }

}
