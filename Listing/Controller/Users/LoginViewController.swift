//
//  LoginViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 07/09/2021.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginContinueButton: UIButton!
    
    // let user: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkUserInfo()
    }

    @IBAction func loginContinuePressed(_ sender: UIButton) {

        if email.text?.isEmpty == true {
            
            // create the alert
            let alert = UIAlertController(title: "Error", message: "Email field is empty.", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)

            print("email empty")
            return
        }
        
        if password.text?.isEmpty == true {
            // create the alert
            let alert = UIAlertController(title: "Error", message: "Password field is empty.", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        login()
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] authResult, error in
            
            guard self != nil else {return}
            if error != nil {
                print(error!)
                // create the alert
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self!.present(alert, animated: true, completion: nil)
            } else {
                if self!.email.text == "admin@admin.com" {
                    
                    let storyBoard: UIStoryboard = UIStoryboard(name: "AdminStoryboard", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "AdminHomePage")
                    newViewController.modalPresentationStyle = .fullScreen
                    self!.present(newViewController, animated: true, completion: nil)
//                    self!.performSegue(withIdentifier: "AdminHomePage", sender: self!.loginContinueButton)
                    
                } else {
                    self!.performSegue(withIdentifier: "goToHomeFromLogin", sender: self!.loginContinueButton)
                }
                
            }
//            self?.user?.checkUserInfo()
            self!.checkUserInfo()
        }
    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
        }
    }
}
