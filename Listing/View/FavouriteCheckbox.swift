//
//  FavouriteCheckbox.swift
//  Listing
//
//  Created by Pakeeza Aqdas on 13/09/2021.
//

import UIKit

final class FavouriteCheckbox: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.secondaryLabel.cgColor
        layer.cornerRadius = frame.size.width / 2.0
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tapped(_ isChecked: Bool) {
        if isChecked {
            backgroundColor = .systemRed
        } else {
            backgroundColor = .systemBackground
        }
    }
    
}
