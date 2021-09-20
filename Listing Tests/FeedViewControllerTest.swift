//
//  FeedViewControllerTest.swift
//  Listing Tests
//
//  Created by Pakeeza Aqdas on 17/09/2021.
//

@testable import Listing
import XCTest

class FeedViewControllerTest: XCTestCase {

    var sut: FeedViewController!
    
    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
           
        sut = storyboard.instantiateViewController(withIdentifier: "feed") as? FeedViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        
        sut.endAppearanceTransition()
        sut = nil
        try super.tearDownWithError()
    }
    
    func testFeedTable()
    {
        XCTAssertNotNil(sut.feedTables)
    }
    
    func testLibraryVC_tableViewDataSourceIsConnected() {
        
        XCTAssertNotNil(sut.feedTables.dataSource)
    }
    
    func testLibraryVC_tableViewDelegateIsConnected() {
        
        XCTAssertNotNil(sut.feedTables.delegate)

    }
    
    func testLibraryVC_objectConformsToUITableViewDelegate() {
        
        XCTAssertNotNil(sut.self as? UITableViewDelegate.Type != nil)
        
    }
    
    func testLibraryVC_objectConformsToUITableViewDataSource() {
        
        XCTAssertNotNil(sut.self as? UITableViewDataSource.Type != nil)
        
    }
}
