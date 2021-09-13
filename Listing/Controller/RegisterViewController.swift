//
//  RegisterViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 07/09/2021.
//

import UIKit
import CoreData
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var reenterPassword: UITextField!
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
  //  var items:[Users]?

    override func viewDidLoad() {
        super.viewDidLoad()
//        fetchUsers()

    }
    
//    func fetchUsers() {
//
//        do {
//            //           self.items = try context.fetch(Users.fetchRequest())
// //           print(items!)
//        } catch {
//            print(error)
//        }
//    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerContinuePressed(_ sender: UIButton) {
        
        if emailAddress.text?.isEmpty == true {
            print("Email empty")
            return
        }
        if password.text?.isEmpty == true {
            print("password empty")
            return
        }
        if reenterPassword.text?.isEmpty == true || reenterPassword.text != password.text {
            print("reenterPassword empty or wrong")
            return
        }
        if name.text?.isEmpty == true {
            print("name empty")
            return
        }
        if phoneNumber.text?.isEmpty == true {
            print("phoneNumber empty")
            return
        }
        
        register()
        //create object
//        let newUser = Users(context: self.context)
//        newUser.name = name.text
//        newUser.email = emailAddress.text
//        newUser.phone_number = phoneNumber.text
//        newUser.password = password.text
//        
        //save data
//        do {
//            try self.context.save()
//            print("saved")
//        } catch {
//            print(error)
//        }
//
//        self.fetchUsers()
    }
    
    func register() {
        Auth.auth().createUser(withEmail: emailAddress.text!, password: password.text!) { (authResult, error) in
            if error == nil {
                let userData = ["name": self.name.text,
                                "phoneNumber": self.phoneNumber.text]
                    let ref = Database.database().reference()
                ref.child("users").child(authResult!.user.uid).setValue(userData)
                } else {
                    print(error!)
                return
            }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homeVC = storyboard.instantiateViewController(identifier: "Home")
            homeVC.modalPresentationStyle = .overFullScreen
            self.present(homeVC, animated: true, completion: nil)
        }
    }
    

}
