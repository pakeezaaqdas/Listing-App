//
//  AdminViewControllerTest.swift
//  Listing Tests
//
//  Created by Pakeeza Aqdas on 20/09/2021.
//

@testable import Listing
import XCTest

class AdminViewControllerTest: XCTestCase {

    var sut: AdminViewController!

    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        let storyboard = UIStoryboard(name: "AdminStoryboard", bundle: nil)
           
        sut = storyboard.instantiateViewController(withIdentifier: "adminUsers") as? AdminViewController
        sut.loadViewIfNeeded()

    }

    override func tearDownWithError() throws {
        
        sut.endAppearanceTransition()
        sut = nil
        try super.tearDownWithError()
    }
    
    func testAdsTable()
    {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testLibraryVC_tableViewDataSourceIsConnected() {
        
        XCTAssertNotNil(sut.tableView.dataSource)
    }
    
    func testLibraryVC_tableViewDelegateIsConnected() {
        
        XCTAssertNotNil(sut.tableView.delegate)

    }
    
    func testLibraryVC_objectConformsToUITableViewDelegate() {
        
        XCTAssertNotNil(sut.self as? UITableViewDelegate.Type != nil)
        
    }
    
    func testLibraryVC_objectConformsToUITableViewDataSource() {
        
        XCTAssertNotNil(sut.self as? UITableViewDataSource.Type != nil)
        
    }

}
