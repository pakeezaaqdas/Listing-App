//
//  ProfileViewControllerTest.swift
//  Listing Tests
//
//  Created by Pakeeza Aqdas on 17/09/2021.
//

@testable import Listing
import XCTest
import Firebase

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
    
    func testCheckUserInfoIfCondition() {
        
        sut.checkUserInfo()
        
        if (sut.uid == "user is not logged in"){
            
            XCTAssertEqual(sut.loginButton.isHidden, false)
            XCTAssertEqual(sut.registerButton.isHidden, false)
            XCTAssertEqual(sut.logoutButton.isHidden, true)
            XCTAssertEqual(sut.editProfileButton.isHidden, true)
            XCTAssertEqual(sut.myAdsButton.isHidden, true)
            XCTAssertEqual(sut.nameLabel.isHidden, true)
            XCTAssertEqual(sut.phoneNumberLabel.isHidden, true)
            XCTAssertEqual(sut.profileImage.isHidden, true)
            XCTAssertEqual(sut.status, "logged out")
        } else {
            XCTAssertEqual(sut.loginButton.isHidden, true)
            XCTAssertEqual(sut.registerButton.isHidden, true)
            XCTAssertEqual(sut.logoutButton.isHidden, false)
            XCTAssertEqual(sut.editProfileButton.isHidden, false)
            XCTAssertEqual(sut.myAdsButton.isHidden, false)
            XCTAssertEqual(sut.status, "not logged out")
        }
    }
    
    func testLogoutPressed() {
        sut.logOutPressed(sut.logoutButton)
        
        XCTAssertEqual(sut.status, "logOutPressed ran")
    }
    
    func testSetUserInfo() {
        sut.name = "test"
        sut.number = "1234567"
        
        sut.setUserInfo()
        
        XCTAssertEqual(sut.nameLabel.text, sut.name)
        XCTAssertEqual(sut.phoneNumberLabel.text, sut.number)
    }
    
}
