//
//  ProfileViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 08/09/2021.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func goToAdmin(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "AdminStoryboard", bundle: nil)
        let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "addNews") as! AddNewsViewController
        self.present(balanceViewController, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
