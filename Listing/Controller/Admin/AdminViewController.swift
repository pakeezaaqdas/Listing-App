//
//  AdminViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 15/09/2021.
//

import UIKit
import Firebase

class AdminViewController: UITableViewController {
    
    var users: [String] = []
    
    private let database = Database.database().reference()
    let uid = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserInfo { user in
            
            self.users = user
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
    }
    
    func getUserInfo(completionHandler: @escaping ([String]) -> ()) {
        
        database.child("users").observe(.value) { snapshot in
            if let dictionary = snapshot.value as? [String: Any] {
                for keyValue in dictionary {
                    let value = keyValue.value as! NSDictionary
                    let userName = value.value(forKey: "name") as! String
                    print(userName)
                    self.users.append(userName)
                }
                
            }
            completionHandler(self.users)
            print(self.users)
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        cell.textLabel?.text = self.users[indexPath.row]
        
        return cell
    }
}
