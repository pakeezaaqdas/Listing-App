//
//  AddNewsViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 15/09/2021.
//

import UIKit
import Firebase

extension String {
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
}

class AddNewsViewController: UIViewController {

    @IBOutlet weak var newsTitleTextField: UITextField!
    @IBOutlet weak var newsDescriptionTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var postButton: UIButton!
    
    private let database = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func postPressed(_ sender: Any) {
        
        if newsTitleTextField.text?.isEmpty == true || newsDescriptionTextField.text?.isEmpty == true || urlTextField.text?.isEmpty == true{
            
            self.createAlertBox(message: "Please fill empty feilds.")
            return
        }
        
        if urlTextField.text?.isValidURL != true {
            
            self.createAlertBox(message: "url is incorrect")
            return
            
        } else {
            post()
        }
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "AdminStoryboard", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AdminHomePage")
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    func post() {
        let newsData = ["newsTitle": newsTitleTextField.text!,
                      "newsDetails": self.newsDescriptionTextField.text!,
                      "url": self.urlTextField.text!] as [String : Any]
        
        database.child("News").childByAutoId().setValue(newsData)
    }
    
    func createAlertBox(message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
