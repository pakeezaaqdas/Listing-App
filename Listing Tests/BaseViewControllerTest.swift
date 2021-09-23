//
//  BaseViewControllerTest.swift
//  Listing Tests
//
//  Created by Pakeeza Aqdas on 22/09/2021.
//

@testable import Listing
import XCTest

class BaseViewControllerTest: XCTestCase {

    var sut: BaseViewController!

    override func setUpWithError() throws {
    
        try super.setUpWithError()
        sut = BaseViewController()
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
    
    func testStringIsURL() {
        sut.url = "test"
        
        XCTAssertEqual(sut.url?.isValidURL, false)
        
        sut.url = "https://www.vadimbulavin.com/unit-testing-view-controller-uiviewcontroller-and-uiview-in-swift/"
        
        XCTAssertTrue(((sut.url?.isValidURL) == true))
    }
}
