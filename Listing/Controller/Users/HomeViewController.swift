//
//  HomeViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 06/09/2021.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UINavigationControllerDelegate {
    
    private let database = Database.database().reference()
    var adArray: [AdsModel] = []
    let uid = Auth.auth().currentUser?.uid
    
    var userID: Any? = nil
    var adDescription: Any? = nil
    var adTitle: Any? = nil
    var category: Any? = nil
    var city: Any? = nil
    var isFavourite: Any? = nil
    var price: Any? = nil
    
    let categories = ["Mobile", "Laptop", "Accesories"]
    let cities = ["Islamabad", "Lahore", "Peshawar", "Karachi"]
    
    @IBOutlet weak var postsTable: UITableView!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    
    var categoriesPickerView = UIPickerView()
    var citiesPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postsTable.dataSource = self
        postsTable.delegate = self
        
        categoriesPickerView.delegate = self
        categoriesPickerView.dataSource = self
        
        citiesPickerView.delegate = self
        citiesPickerView.dataSource = self
        
        categoryTextField.inputView = categoriesPickerView
        cityTextField.inputView = citiesPickerView
        
        if Auth.auth().currentUser?.email == "admin@admin.com" {
            let storyBoard: UIStoryboard = UIStoryboard(name: "AdminStoryboard", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "AdminHomePage")
            newViewController.modalPresentationStyle = .fullScreen
            self.present(newViewController, animated: true, completion: nil)
        } else {
            loadData { ads in
                
                self.adArray = ads
                DispatchQueue.main.async {
                    self.postsTable.reloadData()
                }
            }
        }
    }
    
    func loadData(completionHandler: @escaping ([AdsModel]) -> ()) {
        database.child("Ads").observe(.value) { snapshot in
            if let dictionary = snapshot.value as? [String: Any] {
                for keyValue in dictionary {
                    let value = keyValue.value as! NSDictionary
                    
                    self.userID = value.value(forKey: "uid")
                    self.adDescription = value.value(forKey: "adDescription")
                    self.adTitle =  value.value(forKey: "adTitle")
                    self.category = value.value(forKey: "category")
                    self.city =  value.value(forKey: "city")
                    self.isFavourite =  value.value(forKey: "isFavourite")
                    self.price =  value.value(forKey: "price")

                    let ad = AdsModel(uid: self.userID! as! String, adDescription: self.adDescription! as! String, adTitle: self.adTitle! as! String, category: self.category! as! String, city: self.city! as! String, isFavourite: self.isFavourite! as! String , price: self.price! as! String)
        
                    self.appendArray(category: self.category as! String, city: self.city as! String, ad: ad)
                }
                completionHandler(self.adArray)
                print(self.adArray)
                print(self.adArray.count)
            }
        }
    }
    
    func appendArray(category: String, city: String, ad: AdsModel){
        if categoryTextField.text == category && cityTextField.text == city {
            adArray.append(ad)
        }
        else {
            adArray.append(ad)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        loadData { ads in
            
            self.adArray = ads
            DispatchQueue.main.async {
                self.postsTable.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.adArray.count)
        return self.adArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsCell", for: indexPath) as! AdInfo
        
        cell.adTitleLabel.text = self.adArray[indexPath.row].adTitle
        cell.priceLabel.text = "Rps \(self.adArray[indexPath.row].price)"
        cell.productImage.image = #imageLiteral(resourceName: "mobile-dummy")
    
        return cell
        
    }
}

//MARK: - PickerView methods

extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == categoriesPickerView {
            return categories.count
        } else {
            return cities.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == categoriesPickerView {
            return categories[row]
        } else {
            return cities[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == categoriesPickerView {
            categoryTextField.text = categories[row]
            categoryTextField.resignFirstResponder()
        } else {
            cityTextField.text = cities[row]
            cityTextField.resignFirstResponder()
        }
    }
    
}





