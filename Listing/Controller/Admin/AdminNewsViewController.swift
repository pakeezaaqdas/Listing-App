//
//  AddNewsViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 09/09/2021.
//

import UIKit

class AdminNewsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var status: String?
    
    @IBOutlet weak var adminNewsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        status = ""
        
        adminNewsTable.delegate = self
        adminNewsTable.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add News", style: .plain, target: self, action: #selector(addTapped))

        self.getFromNews { news in
            
            self.newsArray = news
            DispatchQueue.main.async {
                self.adminNewsTable.reloadData()
            }
        }
    }
    
    @objc func addTapped() {
        self.performSegue(withIdentifier: "goToAddNews", sender: self.navigationItem.rightBarButtonItem)
        status = "add tapped"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
        cell.textLabel?.text = self.newsArray[indexPath.row].newsTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: self.newsArray[indexPath.row].newsURL) else { return }
        UIApplication.shared.open(url)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
