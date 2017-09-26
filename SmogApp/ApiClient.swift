//
//  ApiClient.swift
//  SmogApp
//
//  Created by Tomasz Machlowski on 25/09/2017.
//  Copyright © 2017 Tomasz Machlowski. All rights reserved.
//
import UIKit
import Alamofire
import ObjectMapper
import PromiseKit

class ApiClient: NSObject {
    
    enum NetworkingError: Error {
        case unknownError
    }
    
    static let shared = ApiClient(sessionManager: Alamofire.SessionManager.default)
    
    private let sessionManager: Alamofire.SessionManager
    private init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }

    private func handleRequest<T>(request urlRequest: Router, conversionBlock: @escaping (String) -> T?) -> Promise<T> {
        return Promise { fulfill, reject in
            sessionManager.request(urlRequest).responseString(completionHandler: {(response: DataResponse<String>) -> Void in
                if let responseResult = response.result.value, let result = conversionBlock(responseResult) {
                    fulfill(result)
                } else {
                    reject(NetworkingError.unknownError)
                }
            })
        }
    }
    
    private func requestMappablePromise<T: Mappable>(request urlRequest: Router) -> Promise<T> {
        return handleRequest(request: urlRequest, conversionBlock: { Mapper<T>().map(JSONString: $0)})
    }
    
    private func requestMappableArrayPromise<T: Mappable>(request urlRequest: Router) -> Promise<[T]> {
        return handleRequest(request: urlRequest, conversionBlock: { Mapper<T>().mapArray(JSONString: $0)})
    }
    
    func getAllStations() -> Promise<[StationModel]> {
        return requestMappableArrayPromise(request: Router.getAllStations)
    }
    
    func getIndexes(for stationId: Int) -> Promise<IndexesModel> {
        return requestMappablePromise(request: Router.getIndexesForStation(id: stationId))
    }
}
