//
//  AddNewsViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 09/09/2021.
//

import UIKit
import Firebase

class AdminNewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let database = Database.database().reference()
    @IBOutlet weak var adminNewsTable: UITableView!
    var newsArray: [NewsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adminNewsTable.delegate = self
        adminNewsTable.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add News", style: .plain, target: self, action: #selector(addTapped))


        loadNews { news in
            
            self.newsArray = news
            DispatchQueue.main.async {
                self.adminNewsTable.reloadData()
            }
        }
    }
    
    func loadNews(completionHandler: @escaping ([NewsModel]) -> ()) {
        database.child("News").observe(.value) { snapshot in
            if let dictionary = snapshot.value as? [String: Any] {
                for keyValue in dictionary {
                    let value = keyValue.value as! NSDictionary
                    
                    let newsTitle = value.value(forKey: "newsTitle") as! String
                    let newsDetails = value.value(forKey: "newsDetails") as! String
                    let url =  value.value(forKey: "url") as! String
                    
                    let news = NewsModel(newsTitle: newsTitle, newsDescription: newsDetails, newsURL: url)
                    
                    self.newsArray.append(news)
                }
                
            }
            completionHandler(self.newsArray)
        }
    }
    
    @objc func addTapped() {
        self.performSegue(withIdentifier: "goToAddNews", sender: self.navigationItem.rightBarButtonItem)
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
