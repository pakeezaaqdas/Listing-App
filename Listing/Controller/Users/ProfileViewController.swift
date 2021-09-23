//
//  ProfileViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 08/09/2021.
//

import UIKit
import Firebase

class ProfileViewController: BaseViewController {
    
    private let database = Database.database().reference()
    
    var status = ""

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var myAdsButton: UIButton!
    @IBOutlet weak var contactUsButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkUserInfo()
    }

    func checkUserInfo() {
        
        if Auth.auth().currentUser != nil {
    
            loginButton.isHidden = true
            registerButton.isHidden = true
            logoutButton.isHidden = false
            editProfileButton.isHidden = false
            myAdsButton.isHidden = false
            self.getUserInfo{ name, number in
                self.setUserInfo()
            }
            status = "not logged out"
            
        } else {
            loginButton.isHidden = false
            registerButton.isHidden = false
            logoutButton.isHidden = true
            editProfileButton.isHidden = true
            myAdsButton.isHidden = true
            nameLabel.isHidden = true
            phoneNumberLabel.isHidden = true
            profileImage.isHidden = true
            status = "logged out"
        }
    }

    @IBAction func logOutPressed(_ sender: UIButton) {
        
        do {
            try Auth.auth().signOut()
            loadView()
            checkUserInfo()
            
        } catch  {
            print(error)
        }
        status = "logOutPressed ran"

    }
    
    func setUserInfo() {
        self.nameLabel.text = name
        self.phoneNumberLabel.text = number
    }
}
