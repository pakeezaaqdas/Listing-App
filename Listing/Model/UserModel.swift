//
//  UserModel.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 15/09/2021.
//

import Foundation
import UIKit
import Firebase

struct UserModel {
    
//    let uid: String?
//    let userEmail: String?
//    let password: String?
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
        }
    }
    
    func validateUserInfo(email: String, password: String) {
        
        if email.isEmpty == true {
            
            // create the alert
            let alert = UIAlertController(title: "Error", message: "Email field is empty.", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
   //         self.present(alert, animated: true, completion: nil)

            print("email empty")
            return
        }
        
        if password.isEmpty == true {
            // create the alert
            let alert = UIAlertController(title: "Error", message: "Password field is empty.", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
     //       self.present(alert, animated: true, completion: nil)
            return
        }
        
    }
    
    func fetchUserInfo() {
        
    }
    
    func login() {
        
    }
    
}
