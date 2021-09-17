//
//  PostAdViewControllerTest.swift
//  Listing Tests
//
//  Created by Pakeeza Aqdas on 17/09/2021.
//

@testable import Listing
import XCTest

class PostAdViewControllerTest: XCTestCase {

    var sut: PostAdViewController!

    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
           
        sut = storyboard.instantiateViewController(withIdentifier: "postAds") as? PostAdViewController
        sut.loadViewIfNeeded()

        sut.adTitleLabel.text = "Test Title"
        sut.descriptionLabel.text = "Test description"
        sut.categoriesLabel.text = "Mobile"
        sut.cityLabel.text = "Islamabad"
        sut.priceLabel.text = "1000"
    }

    override func tearDownWithError() throws {
        
        sut.endAppearanceTransition()
        sut = nil
        try super.tearDownWithError()
    }
    
    func testAdTitleTextField_WhenCreated_HasAutoCapitalizationSet() throws {
        let adTitleTextField = try XCTUnwrap(sut.adTitleLabel)
                
        XCTAssertEqual(adTitleTextField.autocapitalizationType, UITextAutocapitalizationType.words)
        
        XCTAssertNotEqual(adTitleTextField.text, "")
    }
    
    func testAdDescriptionTextField_WhenCreated_HasAutoCapitalizationSet() throws {
        let adDescriptionTextField = try XCTUnwrap(sut.descriptionLabel)
                
        XCTAssertEqual(adDescriptionTextField.autocapitalizationType, UITextAutocapitalizationType.sentences)
        
        XCTAssertNotEqual(adDescriptionTextField.text, "")
    }
    
    func testCategoriesTextFieldIsConnected() throws {
        let categoriesTextField = try XCTUnwrap(sut.categoriesLabel)
        
        XCTAssertNotEqual(categoriesTextField.text, "")
    }
    
    func testCityTextFieldIsConnected() throws {
        let cityTextField = try XCTUnwrap(sut.cityLabel)
        
        XCTAssertNotEqual(cityTextField.text, "")
    }
    
    func testPriceTextField_WhenCreated_HasNumberPadKeyboardTypeSet() throws {
        
        let priceTextField = try XCTUnwrap(sut.priceLabel)
            
        XCTAssertEqual(priceTextField.keyboardType, UIKeyboardType.numberPad)
        
        XCTAssertNotEqual(priceTextField.text, "")

    }
    
    func testPostAdBtnVerify()
    {
        XCTAssertNotNil(sut.postAdButton)
    }
    
    //MARK: - view controller
    
    func testCreateAlertBox() {
    
        sut.createAlertBox(message: "Error")
    }
}
