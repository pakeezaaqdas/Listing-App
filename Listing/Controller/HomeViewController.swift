//
//  HomeViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 06/09/2021.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var postsTable: UITableView!
    
    let favouriteCheckbox = FavouriteCheckbox(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postsTable.dataSource = self
        postsTable.delegate = self

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsCell", for: indexPath)
        
        let favouriteCheckbox = FavouriteCheckbox(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapFavourite))
        
        favouriteCheckbox.addGestureRecognizer(gesture)
        
        return cell
    }
    
    @objc func didTapFavourite() {
        favouriteCheckbox.tapped(true)
    }
    
}

