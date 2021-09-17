//
//  ProfileViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 08/09/2021.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ProfileViewController: UIViewController {
    
    private let database = Database.database().reference()
    
    var currentUser = Auth.auth().currentUser

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
        
        if currentUser != nil {
            let uid = Auth.auth().currentUser?.uid
            loginButton.isHidden = true
            registerButton.isHidden = true
            logoutButton.isHidden = false
            editProfileButton.isHidden = false
            myAdsButton.isHidden = false
            getUserInfo(with: uid!)
            
        } else {
            loginButton.isHidden = false
            registerButton.isHidden = false
            logoutButton.isHidden = true
            editProfileButton.isHidden = true
            myAdsButton.isHidden = true
            nameLabel.isHidden = true
            phoneNumberLabel.isHidden = true
            profileImage.isHidden = true
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
    }
    
    func getUserInfo(with uid: String) {
        
        database.child("users").child(uid).observe(.value) { snapshot in
            if let dictionary = snapshot.value as? [String: Any] {
                let name = dictionary["name"] as! String
                let number = dictionary["phoneNumber"] as! String
                
                self.nameLabel.text = name
                self.phoneNumberLabel.text = number
            }
        }
    }

}
