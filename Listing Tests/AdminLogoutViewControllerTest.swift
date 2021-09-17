//
//  AdminLogoutTest.swift
//  Listing Tests
//
//  Created by Pakeeza Aqdas on 17/09/2021.
//

@testable import Listing
import XCTest

class AdminLogoutViewControllerTest: XCTestCase {

    var sut: AdminLogoutController!

    override func setUpWithError() throws {
        
        try super.setUpWithError()

        let storyboard = UIStoryboard(name: "AdminStoryboard", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "adminLogout") as? AdminLogoutController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        
        sut.endAppearanceTransition()
        sut = nil
        try super.tearDownWithError()
    }

    func testLogoutBtnVerify()
    {
        XCTAssertNotNil(sut.logoutButton)
    }
}
