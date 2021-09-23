//
//  AdminLogoutController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 15/09/2021.
//

import UIKit
import Firebase

class AdminLogoutController: BaseViewController {
    
    var message = ""

    @IBOutlet weak var logoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        message = "not logged out"
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            loadView()
            self.goToUserHomeView()
        } catch  {
            self.createAlertBox(message: error.localizedDescription)
        }
        
        message = "logoutPressed"
    }
}
