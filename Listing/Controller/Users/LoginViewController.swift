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
    @IBOutlet weak var goToRegisterButton: UIButton!
    
    // let user: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

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
                self!.createAlertBox(message: error!.localizedDescription)
                
            } else {
                if self!.email.text == "admin@admin.com" {
                    
                    let storyBoard: UIStoryboard = UIStoryboard(name: "AdminStoryboard", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "AdminHomePage")
                    newViewController.modalPresentationStyle = .fullScreen
                    self!.present(newViewController, animated: true, completion: nil)
                    
                } else {
                    
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "usersTabbar")
                    newViewController.modalPresentationStyle = .fullScreen
                    self!.present(newViewController, animated: true, completion: nil)
                }
                
            }
            self!.checkUserInfo()
        }
    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
        }
    }
    
    func createAlertBox(message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
