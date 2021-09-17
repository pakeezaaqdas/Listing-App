//
//  NewsModelTest.swift
//  Listing Tests
//
//  Created by Pakeeza Aqdas on 17/09/2021.
//

@testable import Listing
import XCTest

class NewsModelTest: XCTestCase {
    
    let expectedNewsTitle = "Test News Title"
    let expectedNewsDetails = "Test News Description"
    let expectedURL = "https://www.thenews.com.pk/latest/882560-imf-releases-275-billion-to-pakistan"
    
    var newsObj: NewsModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        newsObj = NewsModel(newsTitle: expectedNewsTitle, newsDescription: expectedNewsDetails, newsURL: expectedURL)
    }

    override func tearDownWithError() throws {
        newsObj = nil
        try super.tearDownWithError()
    }
    
    func testSUT_InitializesNewsTitle() {
        XCTAssertEqual(newsObj.newsTitle, expectedNewsTitle)
    }
    
    func testSUT_InitializesNewsDetails() {
        XCTAssertEqual(newsObj.newsDescription, expectedNewsDetails)
    }
    
    func testSUT_InitializesURL() {
        XCTAssertEqual(newsObj.newsURL, expectedURL)
    }
    
}
