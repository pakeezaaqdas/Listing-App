//
//  HomeViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 06/09/2021.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let database = Database.database().reference()
    
    var adArray: [AdsModel] = []
    
    let uid = Auth.auth().currentUser?.uid
    
    @IBOutlet weak var postsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postsTable.dataSource = self
        postsTable.delegate = self
        loadData { ads in
            
            self.adArray = ads
            DispatchQueue.main.async {
                self.postsTable.reloadData()
            }
        }
    }
    
    func loadData(completionHandler: @escaping ([AdsModel]) -> ()) {
        database.child("Ads").observe(.value) { snapshot in
            if let dictionary = snapshot.value as? [String: Any] {
                for keyValue in dictionary {
                    let value = keyValue.value as! NSDictionary
                    
                    let userID = value.value(forKey: "UID")
                    let adDescription = value.value(forKey: "adDescription")
                    let adTitle =  value.value(forKey: "adTitle")
                    let category = value.value(forKey: "category")
                    let city =  value.value(forKey: "city")
                    let isFavourite =  value.value(forKey: "isFavourite")
                    let price =  value.value(forKey: "price")

                    let ad = AdsModel(uid: userID! as! String, adDescription: adDescription! as! String, adTitle: adTitle! as! String, category: category! as! String, city: city! as! String, isFavourite: isFavourite! as! String , price: price! as! String)
        
                    self.adArray.append(ad)
                }
                completionHandler(self.adArray)
                print(self.adArray)
                print(self.adArray.count)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.adArray.count)
        return self.adArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsCell", for: indexPath)
        
        cell.textLabel?.text = self.adArray[indexPath.row].adTitle
    
        return cell
        
    }
}





