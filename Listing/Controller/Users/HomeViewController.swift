//
//  HomeViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 06/09/2021.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UINavigationControllerDelegate {
    
    private let database = Database.database().reference()
    var adArray: [AdsModel] = []
    let uid = Auth.auth().currentUser?.uid
    var currentUserEmail = Auth.auth().currentUser?.email
    
    var userID: Any? = nil
    var adDescription: Any? = nil
    var adTitle: Any? = nil
    var category: Any? = nil
    var city: Any? = nil
    var isFavourite: Any? = nil
    var price: Any? = nil
    
    @IBOutlet weak var postsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postsTable.dataSource = self
        postsTable.delegate = self
        
        if isCurrentUserAdmin() {
            let storyBoard: UIStoryboard = UIStoryboard(name: "AdminStoryboard", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "AdminHomePage")
            newViewController.modalPresentationStyle = .fullScreen
            self.present(newViewController, animated: true, completion: nil)
        } else {
            loadData { ads in
                
                self.adArray = ads
                DispatchQueue.main.async {
                    self.postsTable.reloadData()
                }
            }
        }
    }
    
    func isCurrentUserAdmin() -> Bool {
        if currentUserEmail == "admin@admin.com" {
            return true
        } else {
            return false
        }
    }
    
    func loadData(completionHandler: @escaping ([AdsModel]) -> ()) {
        database.child("Ads").observe(.value) { snapshot in
            if let dictionary = snapshot.value as? [String: Any] {
                for keyValue in dictionary {
                    let value = keyValue.value as! NSDictionary
                    
                    self.userID = value.value(forKey: "uid")
                    self.adDescription = value.value(forKey: "adDescription")
                    self.adTitle =  value.value(forKey: "adTitle")
                    self.category = value.value(forKey: "category")
                    self.city =  value.value(forKey: "city")
                    self.isFavourite =  value.value(forKey: "isFavourite")
                    self.price =  value.value(forKey: "price")

                    let ad = AdsModel(uid: self.userID! as! String, adDescription: self.adDescription! as! String, adTitle: self.adTitle! as! String, category: self.category! as! String, city: self.city! as! String, isFavourite: self.isFavourite! as! String , price: self.price! as! String)

                        self.adArray.append(ad)
                }
                completionHandler(self.adArray)
            }
        }
    }
    
    //MARK: - table functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.adArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsCell", for: indexPath) as! AdInfo
        
        cell.adTitleLabel.text = self.adArray[indexPath.row].adTitle
        cell.priceLabel.text = "Rps \(self.adArray[indexPath.row].price)"
        cell.productImage.image = #imageLiteral(resourceName: "mobile-dummy")
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}




