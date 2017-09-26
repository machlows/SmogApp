//
//  Index.swift
//  SmogApp
//
//  Created by Tomasz Machlowski on 26/09/2017.
//  Copyright © 2017 Tomasz Machlowski. All rights reserved.
//

import UIKit

enum IndexValue: Int{
    case veryGood = 0
    case good = 1
    case moderate = 2
    //not enough specification for the api, right now only first 3 values were visible
    case poor = 3
    case unknown = 4
    
    init(with value: Int) {
        self = IndexValue(rawValue: value) ?? .unknown
    }
}

class Index {
    var name: String
    var indexValue: IndexValue
    
    init(with name: String, indexValue: Int) {
        self.name = name
        self.indexValue = IndexValue(with: indexValue)
    }
}
