//
//  IndexesModel.swift
//  SmogApp
//
//  Created by Tomasz Machlowski on 25/09/2017.
//  Copyright © 2017 Tomasz Machlowski. All rights reserved.
//

import Foundation
import ObjectMapper

class IndexesModel: Mappable {
    var indexes: [Index] = []
    
    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        if map.JSON["stIndexLevel"] != nil, let stIndexValue = map["stIndexLevel.id"].currentValue as? Int {
            indexes.append(Index(with: "st", indexValue: stIndexValue))
        }
        if map.JSON["so2IndexLevel"] != nil, let so2IndexValue = map["so2IndexLevel.id"].currentValue as? Int {
            indexes.append(Index(with: "so2", indexValue: so2IndexValue))
        }
        if map.JSON["no2IndexLevel"] != nil, let no2IndexValue = map["no2IndexLevel.id"].currentValue as? Int {
            indexes.append(Index(with: "no2", indexValue: no2IndexValue))
        }
        if map.JSON["coIndexLevel"] != nil, let coIndexValue = map["coIndexLevel.id"].currentValue as? Int {
            indexes.append(Index(with: "co", indexValue: coIndexValue))
        }
        if map.JSON["pm10IndexLevel"] != nil, let pm10IndexValue = map["pm10IndexLevel.id"].currentValue as? Int {
            indexes.append(Index(with: "pm10", indexValue: pm10IndexValue))
        }
        if map.JSON["pm25IndexLevel"] != nil, let pm25IndexValue = map["pm25IndexLevel.id"].currentValue as? Int {
            indexes.append(Index(with: "pm25", indexValue: pm25IndexValue))
        }
        if map.JSON["o3IndexLevel"] != nil, let o3IndexValue = map["o3IndexLevel.id"].currentValue as? Int {
            indexes.append(Index(with: "o3", indexValue: o3IndexValue))
        }
        if map.JSON["c6h6IndexLevel"] != nil, let c6h6IndexValue = map["c6h6IndexLevel.id"].currentValue as? Int {
            indexes.append(Index(with: "c6h6", indexValue: c6h6IndexValue))
        }
    }
}
