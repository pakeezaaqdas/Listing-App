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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myAdCell", for: indexPath)
        
        // Configure the cell...
        
        if Auth.auth().currentUser != nil {
            let uid = Auth.auth().currentUser?.uid
            database.child("Ads").child(uid!).child(String(indexPath.row)).observe(.value) { snapshot in
                if let dictionary = snapshot.value as? [String: Any] {
                    let title = dictionary["adTitle"] as! String
                    let price = dictionary["price"] as! String

                    let titleLabel:UILabel = cell.viewWithTag(1) as! UILabel
                    titleLabel.text = title

                    let priceLabel:UILabel = cell.viewWithTag(2) as! UILabel
                    priceLabel.text = price

                    print(dictionary)

                } else {
                    print("go to login")
                }
            }
        }
        return cell
    }
}
