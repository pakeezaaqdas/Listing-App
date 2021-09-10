//
//  FeedViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 08/09/2021.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var newsButton: UIButton!
    @IBOutlet weak var blogButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsButton.layer.borderWidth = 1
        newsButton.layer.borderColor = #colorLiteral(red: 0.3598318398, green: 0.528265357, blue: 0.7762874961, alpha: 1)
        
        blogButton.layer.borderWidth = 1
        blogButton.layer.borderColor = #colorLiteral(red: 0.3598318398, green: 0.528265357, blue: 0.7762874961, alpha: 1)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
