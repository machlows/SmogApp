//
//  IndexCollectionViewCell.swift
//  SmogApp
//
//  Created by Tomasz Machlowski on 26/09/2017.
//  Copyright © 2017 Tomasz Machlowski. All rights reserved.
//

import UIKit

class IndexCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var qualityLabel: UILabel!
    @IBOutlet weak var circleView: ProgresCircleView!
    
    func configure(with viewModel: IndexViewModel) {
        typeLabel.text = viewModel.indexName
        qualityLabel.text = viewModel.qualityValue
        circleView.mainColor = viewModel.circleColor
        circleView.drawCircle(center: CGPoint(x: circleView.center.x - 10, y: circleView.center.y - 20) , radius: circleView.frame.width/2, percentage: CGFloat(viewModel.circlePart))
        
    }
}
