//
//  EditProfileViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 09/09/2021.
//

import UIKit
import Firebase

class EditProfileViewController: UIViewController {
    
    private let database = Database.database().reference()
    let uid = Auth.auth().currentUser?.uid

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkUserInfo()
    }
    
    func checkUserInfo() {
        
        if Auth.auth().currentUser != nil {
            print(uid!)
            getUserInfo(with: uid!)
            
        }
    }
    
    func getUserInfo(with uid: String) {
        
        database.child("users").child(uid).observe(.value) { snapshot in
            if let dictionary = snapshot.value as? [String: Any] {
                let name = dictionary["name"] as! String
                let number = dictionary["phoneNumber"] as! String
                
                self.nameTextField.text = name
                self.numberTextField.text = number
            }
        }
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        let userUpdatedData = ["name": nameTextField.text,
                               "phoneNumber": numberTextField.text]
        
        database.child("users").child(uid!).setValue(userUpdatedData)
        print("Updated")
    }
    
}
