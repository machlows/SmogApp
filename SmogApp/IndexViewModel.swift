//
//  IndexViewModel.swift
//  SmogApp
//
//  Created by Tomasz Machlowski on 26/09/2017.
//  Copyright © 2017 Tomasz Machlowski. All rights reserved.
//

import UIKit

class IndexViewModel {
    private var index: Index
    var indexName: String {
        return index.name
    }
    
    var circlePart: Float {
        switch index.indexValue {
        case .veryGood:
            return 1.0
        case .good:
            return 0.75
        case .moderate:
            return 0.5
        case .poor:
            return 0.25
        case .unknown:
            return 0.0
        }
    }
    
    var qualityValue: String {
        switch index.indexValue {
        case .veryGood:
            return "Very good"
        case .good:
            return "Good"
        case .moderate:
            return "Moderate"
        case .poor:
            return "Poor"
        case .unknown:
            return "_"
        }
    }
    
    var circleColor: UIColor {
        switch index.indexValue {
        case .veryGood:
            return UIColor.green
        case .good:
            return UIColor.yellow
        case .moderate:
            return UIColor.orange
        case .poor:
            return UIColor.red
        case .unknown:
            return UIColor.black
        }
    }

    init(with index: Index) {
        self.index = index
    }
}
