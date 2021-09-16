//
//  NewsModel.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 15/09/2021.
//

import Foundation

class NewsModel {
    
    let newsTitle: String
    let newsDescription: String
    let newsURL: String

    init(newsTitle: String, newsDescription: String, newsURL: String) {
                
        self.newsTitle = newsTitle
        self.newsDescription = newsDescription
        self.newsURL = newsURL
    }
}
