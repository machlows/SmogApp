//
//  StationTableViewCell.swift
//  SmogApp
//
//  Created by Tomasz Machlowski on 25/09/2017.
//  Copyright © 2017 Tomasz Machlowski. All rights reserved.
//

import UIKit

class StationTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    func configure(with model: StationModel) {
        nameLabel.text = model.name
        if let city = model.city {
            cityLabel.text = city.name
        } else {
            cityLabel.text = "no data"
        }
    }
 
}
