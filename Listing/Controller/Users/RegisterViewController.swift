//
//  RegisterViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 07/09/2021.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: BaseViewController {
    
    var message: String?
    
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var reenterPassword: UITextField!
    @IBOutlet weak var registerContinueButton: UIButton!
    
    override func viewDidLoad() {
        message = ""
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func registerContinuePressed(_ sender: UIButton) {
       
        if emailAddress.text?.isEmpty == true || password.text?.isEmpty == true || reenterPassword.text?.isEmpty == true ||  nameTextField.text?.isEmpty == true || phoneNumber.text?.isEmpty == true {
            
            message = "Please fill empty feilds."
            self.createAlertBox(message: message!)
            return
        }

        if passwordAndReenterPasswordAreNotEqual(password: password.text!, reenterPassword: reenterPassword.text!) {
            
            message = "Passwords do not match."
            self.createAlertBox(message: message!)
        } else {
            register()
            message = "registering"
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: emailAddress.text!, password: password.text!) { (authResult, error) in
            if error == nil {
                let userData = ["name": self.nameTextField.text,
                                "phoneNumber": self.phoneNumber.text]
                let ref = Database.database().reference()
                ref.child("users").child(authResult!.user.uid).setValue(userData)
                
                self.goToUserHomeView()
                
            } else {
                self.createAlertBox(message: error!.localizedDescription)
            }
        }
    }
    
    func passwordAndReenterPasswordAreNotEqual(password: String, reenterPassword: String) -> Bool {
        if password != reenterPassword {
            return true
        } else {
            return false
        }
    }
}
