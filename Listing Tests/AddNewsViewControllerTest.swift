//
//  AddNewsViewControllerTest.swift
//  Listing Tests
//
//  Created by Pakeeza Aqdas on 17/09/2021.
//

@testable import Listing
import XCTest

class AddNewsViewControllerTest: XCTestCase {

    var sut: AddNewsViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let storyBoard = UIStoryboard.init(name: "AdminStoryboard", bundle: nil)
        sut = storyBoard.instantiateViewController(identifier: "adminAddNews")
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testNewsTitleTextField_WhenCreated_HasAutoCapitalizationSet() throws {
        let newsTitleTextField = try XCTUnwrap(sut.newsTitleTextField)
        
        XCTAssertEqual(newsTitleTextField.autocapitalizationType, UITextAutocapitalizationType.sentences)
    }
    
    func testNewsDescriptionTextField_WhenCreated_HasAutoCapitalizationSet() throws {
        let newsDescriptionTextField = try XCTUnwrap(sut.newsDescriptionTextField)
        
        XCTAssertEqual(newsDescriptionTextField.autocapitalizationType, UITextAutocapitalizationType.sentences)
    }
    
    func testURLTextField_WhenCreated_HasURLContentType_And_URLKeyboardTypeSet() throws {
        
        let urlTextField = try XCTUnwrap(sut.urlTextField)
        XCTAssertEqual(urlTextField.textContentType, UITextContentType.URL)
        
        XCTAssertEqual(urlTextField.keyboardType, UIKeyboardType.URL)
    }
    
    func testPostBtnVerify()
    {
        XCTAssertNotNil(sut.postButton)
    }
    
    func testCreateAlertBox() {
    
        sut.createAlertBox(message: "Error")
    }
    
    func testPostPressed() {
        sut.newsTitleTextField.text = ""
        sut.postPressed(sut.postButton!)
        XCTAssertEqual(sut.message, "Please fill empty feilds.")
        
        sut.newsTitleTextField.text = "test"
        sut.newsDescriptionTextField.text = ""
        sut.postPressed(sut.postButton!)
        XCTAssertEqual(sut.message, "Please fill empty feilds.")

        sut.newsDescriptionTextField.text = "test"
        sut.urlTextField.text = ""
        sut.postPressed(sut.postButton!)
        XCTAssertEqual(sut.message, "Please fill empty feilds.")

        sut.urlTextField.text = "test"
        sut.postPressed(sut.postButton!)
        XCTAssertEqual(sut.message, "url is incorrect")
    }

}
