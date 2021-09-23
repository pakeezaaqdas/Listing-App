//
//  LoginViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 07/09/2021.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: BaseViewController {
    
    var message: String?
    var status: String?

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginContinueButton: UIButton!
    @IBOutlet weak var goToRegisterButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        status = ""
        message = ""
    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        checkUserInfo()
//    }

    @IBAction func loginContinuePressed(_ sender: UIButton) {

        if email.text?.isEmpty == true {
            
            message = "Email field is empty."
            self.createAlertBox(message: message!)
            return
        }
        
        if password.text?.isEmpty == true {
            message = "Password field is empty."
            self.createAlertBox(message: message!)
            return
        }
        
        login()
        status = "logging in"
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] authResult, error in
            
            guard self != nil else {return}
            if error != nil {
                
                self!.message = error!.localizedDescription
                self!.createAlertBox(message: self!.message!)
                
            } else {
                if self!.email.text == "admin@admin.com" {
                    self?.goToAdminHomeView()
                    
                } else {
                    self?.goToUserHomeView()
                }
            }
//            self!.checkUserInfo()
        }
        
        status = "login() ran"
    }
    
//    func checkUserInfo() {
//        if Auth.auth().currentUser != nil {
//            print(Auth.auth().currentUser?.uid)
//        }
//    }
    
//    func createAlertBox(message: String){
//        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
//
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//
//        self.present(alert, animated: true, completion: nil)
//    }
}
