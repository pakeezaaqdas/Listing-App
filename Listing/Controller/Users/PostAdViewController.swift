//
//  PostAdViewController.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 08/09/2021.
//

import UIKit
import Firebase

class PostAdViewController: BaseViewController, UITextFieldDelegate, UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    
    var message: String?
    
    @IBOutlet weak var categoriesLabel: UITextField!
    @IBOutlet weak var adTitleLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextField!
    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var priceLabel: UITextField!
    @IBOutlet weak var postAdButton: UIButton!
    
    private let database = Database.database().reference()
    
    
    let categories = ["Mobile", "Laptop", "Accesories"]
    let cities = ["Islamabad", "Lahore", "Peshawar", "Karachi"]
        
    var categoriesPickerView = UIPickerView()
    var citiesPickerView = UIPickerView()

    @IBOutlet weak var productImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        message = ""
        
        categoriesPickerView.delegate = self
        categoriesPickerView.dataSource = self
        
        citiesPickerView.delegate = self
        citiesPickerView.dataSource = self
        
        categoriesLabel.inputView = categoriesPickerView
        cityLabel.inputView = citiesPickerView
        
        adTitleLabel.delegate = self
        self.hideKeyboardWhenTappedAround()

    }
    
  
    //MARK: - Firebase methods
    
    @IBAction func postAdPressed(_ sender: UIButton) {
        
        if categoriesLabel.text?.isEmpty == true || cityLabel.text?.isEmpty == true || adTitleLabel.text?.isEmpty == true || descriptionLabel.text?.isEmpty == true || priceLabel.text?.isEmpty == true {
            
            message = "Please fill empty fields"
            self.createAlertBox(message: message!)
            return
        }
        if checkUserInfo() {
            self.setAdInfo(for: self.uid!, category: self.categoriesLabel.text!, adTitle: self.adTitleLabel.text!, adDescription: self.descriptionLabel.text!, city: self.cityLabel.text!, price:  self.priceLabel.text!, isFavourite: "false")
            setTextFieldsEmpty()
            self.performSegue(withIdentifier: "goToMyAds", sender: self.postAdButton)
        }
    }
    
    func setTextFieldsEmpty() {
        categoriesLabel.text = ""
        adTitleLabel.text = ""
        cityLabel.text = ""
        priceLabel.text = ""
        descriptionLabel.text = ""
    }
    
    func checkUserInfo() -> Bool {
        if Auth.auth().currentUser != nil {
            return true
        } else {
            view.endEditing(true)
            self.goToLoginView()
            return false
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if  textField == adTitleLabel
        {
            _ = checkUserInfo()
        }
    }
}


//MARK: - PickerView methods

extension PostAdViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
            categoriesLabel.text = categories[row]
            categoriesLabel.resignFirstResponder()
        } else {
            cityLabel.text = cities[row]
            cityLabel.resignFirstResponder()
        }
    }
    
    //MARK: - Image functions
    
//    @IBAction func onClickAddImage(_ sender: Any) {
//
//        print("Image tapped")
//        actionSheet()
//    }
//
//    func actionSheet(){
//        let alert = UIAlertController(title: "Choose image", message: nil, preferredStyle: .actionSheet)
//
//        alert.addAction(UIAlertAction(title: "Open Camera", style: .default, handler: { (handler) in
//            self.openCamera()
//        }))
//
//        alert.addAction(UIAlertAction(title: "Open Gallery", style: .default, handler: { (handler) in
//            self.openGallery()
//        }))
//
//        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (handler) in
//
//        }))
//
//        self.present(alert, animated: true, completion: nil)
//    }
//
//    func openCamera() {
//
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            let image = UIImagePickerController()
//            image.delegate = self
//            image.allowsEditing = true
//            image.sourceType = .camera
//            self.present(image, animated: true, completion: nil)
//        }
//    }
//
//    func openGallery() {
//
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//            let image = UIImagePickerController()
//            image.delegate = self
//            image.sourceType = .photoLibrary
//            image.allowsEditing = true
//            self.present(image, animated: true, completion: nil)
//        }
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [
//                               String : Any]) {
//
//        let chosenImage = info[UIImagePickerController.InfoKey.editedImage.rawValue] as! UIImage
//        productImage.image = chosenImage
//        dismiss(animated: true, completion: nil)
//    }
//    import MobileCoreServices
// UIImagePickerControllerDelegate,
    
}
