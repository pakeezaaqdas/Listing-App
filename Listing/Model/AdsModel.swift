//
//  AdsModel.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 13/09/2021.
//

import Foundation
import Firebase

//private let database = Database.database().reference()

class AdsModel {
    
//    let obj: [Any]
    
    let uid: String
    let adDescription: String
    let adTitle: String
    let category: String
    let city: String
    let isFavourite: String
    let price: String

    init(uid: String, adDescription: String, adTitle: String, category: String, city: String, isFavourite: String, price: String) {
                
        self.uid = uid
        self.adDescription = adDescription
        self.adTitle = adTitle
        self.category = category
        self.city = city
        self.isFavourite = isFavourite
        self.price = price
    }
}
