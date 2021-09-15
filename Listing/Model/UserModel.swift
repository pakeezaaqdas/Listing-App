//
//  UserModel.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 15/09/2021.
//

import Foundation
import Firebase

struct UserModel {
    
    let uid: String?
    let userEmail: String?
    let password: String?
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
        }
    }
    
    func validateUserInfo() {
        
    }
    
    func fetchUserInfo() {
        
    }
    
    func login() {
        
    }
    
}
