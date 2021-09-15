//
//  RegisterViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 07/09/2021.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var reenterPassword: UITextField!
    @IBOutlet weak var registerContinueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerContinuePressed(_ sender: UIButton) {
       
        if emailAddress.text?.isEmpty == true || password.text?.isEmpty == true || reenterPassword.text?.isEmpty == true ||  name.text?.isEmpty == true || phoneNumber.text?.isEmpty == true {
            
            self.createAlertBox(message: "Please fill empty feilds.")
            return
        }

        if password.text != reenterPassword.text {
            self.createAlertBox(message: "Passwords do not match.")
        } else {
            register()
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: emailAddress.text!, password: password.text!) { (authResult, error) in
            if error == nil {
                let userData = ["name": self.name.text,
                                "phoneNumber": self.phoneNumber.text]
                    let ref = Database.database().reference()
                ref.child("users").child(authResult!.user.uid).setValue(userData)
                
                self.performSegue(withIdentifier: "goToHome", sender: self.registerContinueButton)
                
            } else {
                self.createAlertBox(message: error!.localizedDescription)
                }
            
        }
    }
    
    func createAlertBox(message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
