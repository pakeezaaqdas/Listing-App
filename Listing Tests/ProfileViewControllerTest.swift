//
//  ProfileViewControllerTest.swift
//  Listing Tests
//
//  Created by Pakeeza Aqdas on 17/09/2021.
//

@testable import Listing
import XCTest

class ProfileViewControllerTest: XCTestCase {

    var sut: ProfileViewController!

    override func setUpWithError() throws {
        
        try super.setUpWithError()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
           
        sut = storyboard.instantiateViewController(withIdentifier: "profile") as? ProfileViewController
        sut.loadViewIfNeeded()
            
    }

    override func tearDownWithError() throws {
        
        sut.endAppearanceTransition()
        sut = nil
        
        try super.tearDownWithError()
    }
    
    //MARK: - view controller
    
    func testLoginBtnVerify()
    {
        XCTAssertNotNil(sut.loginButton)
    }
    
    func testRegisterBtnVerify()
    {
        XCTAssertNotNil(sut.registerButton)
    }
    
    func testLogoutBtnVerify()
    {
        XCTAssertNotNil(sut.logoutButton)
    }
    
    func testMyAdsBtnVerify()
    {
        XCTAssertNotNil(sut.myAdsButton)
    }
    
    func testProfileBtnVerify()
    {
        XCTAssertNotNil(sut.editProfileButton)
    }
    
    func testContactUsBtnVerify()
    {
        XCTAssertNotNil(sut.contactUsButton)
    }
    
//    func testCurrentUserIsNotNil() {
//        sut.currentUser = FIRUser: 0x600000729700
//        XCTAssertNotNil(sut.currentUser)
//    }
    
}
