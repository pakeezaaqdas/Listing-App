//
//  BaseViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 20/09/2021.
//

import UIKit
import Firebase

class BaseViewController: UIViewController {
    
    var uid: String?
    
    var currentUserEmail = Auth.auth().currentUser?.email
    private let database = Database.database().reference()
    
    //user
    var name: String?
    var number: String?
    
    //news
    var news: NewsModel?
    var newsTitle: String?
    var newsDetails: String?
    var url: String?
    var newsArray: [NewsModel] = []
    
    //ad
    var ad: AdsModel?
    var userID: String?
    var adDescription: String?
    var adTitle: String?
    var category: String?
    var city: String?
    var isFavourite: String?
    var price: String?
    var adArray: [AdsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUID()
    }
    
    func getUID() {
        uid = Auth.auth().currentUser?.uid
        if uid == nil {
            uid = "user is not logged in"
        }
    }

  //MARK: - news database
    
    func getFromNews(completionHandler: @escaping ([NewsModel]) -> ()) {
        database.child("News").observe(.value) { snapshot in
            if let dictionary = snapshot.value as? [String: Any] {
                for keyValue in dictionary {
                    let value = keyValue.value as! NSDictionary

                    self.newsTitle = value.value(forKey: "newsTitle") as? String
                    self.newsDetails = value.value(forKey: "newsDetails") as? String
                    self.url =  value.value(forKey: "url") as? String

                    self.news = NewsModel(newsTitle: self.newsTitle!, newsDescription: self.newsDetails!, newsURL: self.url!)

                    self.newsArray.append(self.news!)
                }
            }
            completionHandler(self.newsArray)
        }
    }
    
    func setNewNews(newsTitle: String, newsDetails: String, newsURL: String) {
        let newsData = ["newsTitle": newsTitle ,
                      "newsDetails": newsDetails,
                      "url": newsURL] as [String : Any]
        
        database.child("News").childByAutoId().setValue(newsData)
    }
    
    //MARK: - users database
    
    //get user's information
    func getUserInfo(completionHandler: @escaping (String, String) -> ()) {
        
        database.child("users").child(uid!).observe(.value) { snapshot in
            if let dictionary = snapshot.value as? [String: Any] {
                self.name = dictionary["name"] as? String
                self.number = dictionary["phoneNumber"] as? String
            }
            completionHandler(self.name!, self.number!)
        }
    }
    
    //MARK: - ads database
    
    func getAdInfo(completionHandler: @escaping ([AdsModel]) -> ()) {
        database.child("Ads").observe(.value) { snapshot in
            if let dictionary = snapshot.value as? [String: Any] {
                for keyValue in dictionary {
                    let value = keyValue.value as! NSDictionary

                    self.userID = value.value(forKey: "uid") as? String
                    self.adDescription = value.value(forKey: "adDescription") as? String
                    self.adTitle =  value.value(forKey: "adTitle") as? String
                    self.category = value.value(forKey: "category") as? String
                    self.city =  value.value(forKey: "city") as? String
                    self.isFavourite =  value.value(forKey: "isFavourite") as? String
                    self.price =  value.value(forKey: "price") as? String

                    let ad = AdsModel(uid: self.userID!,  adDescription: self.adDescription!, adTitle: self.adTitle!, category: self.category!, city: self.city!, isFavourite: self.isFavourite!, price: self.price!)

                        self.adArray.append(ad)
                }
                completionHandler(self.adArray)
            }
        }
    }
    
    func setAdInfo(for uid: String, category: String, adTitle: String, adDescription: String, city: String, price: String, isFavourite: String) {
        
        let adData = ["uid": uid,
                      "category": category,
                      "adTitle": adTitle,
                      "adDescription": adDescription,
                      "city": city,
                      "price": price,
                      "isFavourite": isFavourite] as [String : Any]
        
        self.database.child("Ads").childByAutoId().setValue(adData)
    }
    
    
    //MARK: - goToAdminHomeView
    
    func goToAdminHomeView() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "AdminStoryboard", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AdminHomePage")
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
    
    //MARK: - goToLoginView
    
    func goToLoginView(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(identifier: "Login")
        homeVC.modalPresentationStyle = .overFullScreen
        self.present(homeVC, animated: true, completion: nil)
    }
    
    //MARK: - goToUserHomeView
    
    func goToUserHomeView() {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "usersTabbar")
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
    
    //MARK: - create alert box
    
    func createAlertBox(message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - string is a URL

extension String {
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
}
