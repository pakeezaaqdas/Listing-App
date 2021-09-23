//
//  FeedViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 08/09/2021.
//

import UIKit

class FeedViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var feedTables: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedTables.delegate = self
        feedTables.dataSource = self
        
        self.getFromNews { news in
            
            self.newsArray = news
            DispatchQueue.main.async {
                self.feedTables.reloadData()
            }
        }
    }
    
    //MARK: - table view functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {  return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BlogCell", for: indexPath)
        cell.textLabel?.text = self.newsArray[indexPath.row].newsTitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: self.newsArray[indexPath.row].newsURL) else { return }
        UIApplication.shared.open(url)
    }
}

//private let database = Database.database().reference()

//    func loadNews(completionHandler: @escaping ([NewsModel]) -> ()) {
//        database.child("News").observe(.value) { snapshot in
//            if let dictionary = snapshot.value as? [String: Any] {
//                for keyValue in dictionary {
//                    let value = keyValue.value as! NSDictionary
//
//                    let newsTitle = value.value(forKey: "newsTitle") as! String
//                    let newsDetails = value.value(forKey: "newsDetails") as! String
//                    let url =  value.value(forKey: "url") as! String
//
//                    let news = NewsModel(newsTitle: newsTitle, newsDescription: newsDetails, newsURL: url)
//
//                    self.newsArray.append(news)
//                }
//
//            }
//            completionHandler(self.newsArray)
//        }
//    }

//    func append(news: NewsModel, completionHandler: @escaping ([NewsModel]) -> ()) {
//        newsArray.append(news)
//        completionHandler(self.newsArray)
//    }


