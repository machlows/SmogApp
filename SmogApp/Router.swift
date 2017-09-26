//
//  Router.swift
//  SmogApp
//
//  Created by Tomasz Machlowski on 25/09/2017.
//  Copyright © 2017 Tomasz Machlowski. All rights reserved.
//

import UIKit
import Alamofire

enum Router: URLRequestConvertible  {
    case getAllStations
    case getIndexesForStation(id: Int)
    
    static var baseUrlString: String {
        return "http://api.gios.gov.pl/pjp-api/rest"
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getAllStations, .getIndexesForStation:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getAllStations:
            return  "/station/findAll"
        case .getIndexesForStation(let id):
            return  "/aqindex/getIndex/\(id)"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let requestURL = URL(string: Router.baseUrlString)
        var request = URLRequest(url: requestURL!.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        return request
    }
    
}


