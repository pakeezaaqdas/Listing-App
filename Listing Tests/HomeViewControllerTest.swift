//
//  HomeViewControllerTest.swift
//  Listing Tests
//
//  Created by Pakeeza Aqdas on 17/09/2021.
//

@testable import Listing
import XCTest

class HomeViewControllerTest: XCTestCase {

    var sut: HomeViewController!

    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
           
        sut = storyboard.instantiateViewController(withIdentifier: "Home") as? HomeViewController
        sut.loadViewIfNeeded()

    }

    override func tearDownWithError() throws {
        
        sut.endAppearanceTransition()
        sut = nil
        try super.tearDownWithError()
    }
    
    func testAdsTable()
    {
        XCTAssertNotNil(sut.postsTable)
    }

    //MARK: - view controller
    func testIsCurrentUserAdminTrueCase() {
        sut.currentUserEmail = "admin@admin.com"
        XCTAssertTrue(sut.isCurrentUserAdmin())
    }
    
    func testIsCurrentUserAdminFalseCase() {
        sut.currentUserEmail = "test@test.com"
        XCTAssertFalse(sut.isCurrentUserAdmin())
    }
    
    func testLibraryVC_tableViewDataSourceIsConnected() {
        
        XCTAssertNotNil(sut.postsTable.dataSource)
    }
    
    func testLibraryVC_tableViewDelegateIsConnected() {
        
        XCTAssertNotNil(sut.postsTable.delegate)

    }
    
    func testLibraryVC_objectConformsToUITableViewDelegate() {
        
        XCTAssertNotNil(sut.self as? UITableViewDelegate.Type != nil)
        
    }
    
    func testLibraryVC_objectConformsToUITableViewDataSource() {
        
        XCTAssertNotNil(sut.self as? UITableViewDataSource.Type != nil)
        
    }
    
    func testIfConditionViewDidLoad(){
        sut.currentUserEmail = "admin@admin.com"
        sut.viewDidLoad()
        XCTAssertEqual(sut.status, "Current user is admin")
        
        sut.currentUserEmail = "test@test.com"
        sut.viewDidLoad()
        XCTAssertEqual(sut.status, "Current user is not admin")
    }
    
    

}
