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
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkUserInfo()
    }

    @IBAction func registerNowPressed(_ sender: UIButton) {
        

    }
    @IBAction func loginContinuePressed(_ sender: UIButton) {

        if email.text?.isEmpty == true {
            print("email empty")
            return
        }
        
        if password.text?.isEmpty == true {
            print("password empty")
            return
        }
        
        login()
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] authResult, error in
            
            guard self != nil else {return}
            if error != nil {
                print(error!)
            }
            self!.checkUserInfo()
        }
    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homeVC = storyboard.instantiateViewController(identifier: "Home")
            homeVC.modalPresentationStyle = .overFullScreen
            self.present(homeVC, animated: true, completion: nil)
        }
    }
}
