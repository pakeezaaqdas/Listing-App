//
//  AdsModelTest.swift
//  Listing Tests
//
//  Created by Pakeeza Aqdas on 17/09/2021.
//

@testable import Listing
import XCTest

class AdsModelTest: XCTestCase {
    
    let expectedUID = "WE567VEwertfv5677"
    let expectedAdDescription = "test description"
    let expectedAdTitle = "test title"
    let expectedCategory = "Mobile"
    let expectedCity = "Islamabad"
    let expectedIsFavourite = "false"
    let expectedPrice = "1000"
    
    var adsObj: AdsModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        adsObj = AdsModel(uid: expectedUID, adDescription: expectedAdDescription, adTitle: expectedAdTitle, category: expectedCategory, city: expectedCity, isFavourite: expectedIsFavourite, price: expectedPrice)
    }

    override func tearDownWithError() throws {
        adsObj = nil
        try super.tearDownWithError()
    }

    func testSUT_InitializesUID() {
            XCTAssertEqual(adsObj.uid, expectedUID)
    }
    
    func testSUT_InitializesAdTitle() {
            XCTAssertEqual(adsObj.adTitle, expectedAdTitle)
    }
    
    func testSUT_InitializesAdDescription() {
            XCTAssertEqual(adsObj.adDescription, expectedAdDescription)
    }
    
    func testSUT_InitializesCategory() {
            XCTAssertEqual(adsObj.category, expectedCategory)
    }
    
    func testSUT_InitializesCity() {
            XCTAssertEqual(adsObj.city, expectedCity)
    }
    
    func testSUT_InitializesIsFavourite() {
            XCTAssertEqual(adsObj.isFavourite, expectedIsFavourite)
    }
    
    func testSUT_InitializesPrice() {
            XCTAssertEqual(adsObj.price, expectedPrice)
    }
    
}
