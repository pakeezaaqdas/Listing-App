//
//  MyAdsViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 08/09/2021.
//

import UIKit
import Firebase

class MyAdsViewController: UITableViewController {
    
    private let database = Database.database().reference()
    
    var adArray: [AdsModel] = []
    
    let uid = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData { ads in
            
            self.adArray = ads
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - loading data
    
    func loadData(completionHandler: @escaping ([AdsModel]) -> ()) {
        database.child("Ads").observe(.value) { snapshot in
            if let dictionary = snapshot.value as? [String: Any] {
                for keyValue in dictionary {
                    let value = keyValue.value as! NSDictionary
                    
                    let userID = value.value(forKey: "uid") as! String
                    let adDescription = value.value(forKey: "adDescription")
                    let adTitle =  value.value(forKey: "adTitle")
                    let category = value.value(forKey: "category")
                    let city =  value.value(forKey: "city")
                    let isFavourite =  value.value(forKey: "isFavourite")
                    let price =  value.value(forKey: "price")

                    if self.uid == userID {
                        let ad = AdsModel(uid: userID , adDescription: adDescription! as! String, adTitle: adTitle! as! String, category: category! as! String, city: city! as! String, isFavourite: isFavourite! as! String , price: price! as! String)
            
                        self.adArray.append(ad)
                    }
                    
                }
                completionHandler(self.adArray)
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.adArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myAdCell", for: indexPath) as! MyAdInfoCell
        cell.adTitleLabel.text = self.adArray[indexPath.row].adTitle
        cell.adDescription.text = self.adArray[indexPath.row].adDescription
        cell.priceLabel.text = "Rps \(self.adArray[indexPath.row].price)"
        cell.productImage.image = #imageLiteral(resourceName: "mobile-dummy")
        
        return cell
    }
}
