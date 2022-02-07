//
//  CustomTableViewCell.swift
//  MyPlaces
//
//  Created by Max Pavlov on 29.01.22.
//

import UIKit
import Cosmos

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageOfPlace: UIImageView! {
        didSet {
            imageOfPlace.layer.cornerRadius = imageOfPlace.frame.size.height / 2
            imageOfPlace.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var ratingControl: CosmosView! {
        didSet {
            ratingControl.settings.updateOnTouch = false
        }
    }
}
