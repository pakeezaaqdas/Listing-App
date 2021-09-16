//
//  FeedViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 08/09/2021.
//

import UIKit
import Firebase

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let database = Database.database().reference()
    
    var newsArray: [NewsModel] = []
    
    let uid = Auth.auth().currentUser?.uid
    
    var buttonPressed: String?
    
    @IBOutlet weak var newsButton: UIButton!
    @IBOutlet weak var blogButton: UIButton!
    @IBOutlet weak var feedTables: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsButton.layer.borderWidth = 1
        newsButton.layer.borderColor = #colorLiteral(red: 0.3598318398, green: 0.528265357, blue: 0.7762874961, alpha: 1)
        
        blogButton.layer.borderWidth = 1
        blogButton.layer.borderColor = #colorLiteral(red: 0.3598318398, green: 0.528265357, blue: 0.7762874961, alpha: 1)
        
        feedTables.delegate = self
        feedTables.dataSource = self
        
        loadNews { news in
            
            self.newsArray = news
            DispatchQueue.main.async {
                self.feedTables.reloadData()
            }
        }
        
    }
    
    @IBAction func newsButtonPressed(_ sender: UIButton) {
        
        self.feedTables.reloadData()
        self.navigationController?.title = "News"
        buttonPressed = newsButton.currentTitle
    }
    
    @IBAction func blogButtonPressed(_ sender: UIButton) {
        
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
    
    //MARK: - table view functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if buttonPressed == "News" {
            return newsArray.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BlogCell", for: indexPath)
        if buttonPressed == "News" {
            cell.textLabel?.text = self.newsArray[indexPath.row].newsTitle
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: self.newsArray[indexPath.row].newsURL) else { return }
        UIApplication.shared.open(url)
    }
}


