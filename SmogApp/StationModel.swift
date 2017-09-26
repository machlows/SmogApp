//
//  StationModel.swift
//  SmogApp
//
//  Created by Tomasz Machlowski on 25/09/2017.
//  Copyright © 2017 Tomasz Machlowski. All rights reserved.
//

import Foundation
import ObjectMapper

class StationModel: Mappable {
    var id: Int!
    var name: String!
    var city: CityModel!

    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        id    <- map["id"]
        name  <- map["stationName"]
        city  <- map["city"]
    }
}
