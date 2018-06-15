//
//  DataManager.swift
//  Coin
//
//  Created by Арина on 14.06.18.
//  Copyright © 2018 Арина. All rights reserved.
//

import Foundation
import AFNetworking

class DataManager {
    var  baseUrl : String;
    
    init(newBaseURL : String) {
        self.baseUrl = newBaseURL
    }
    
    public func runRequest(request : APIRequest, successBlock: @escaping (Dictionary<String, AnyObject>?) -> Void, failureBlock: @escaping (String?) -> Void) {
        let manager = AFHTTPSessionManager()
        manager.get(
            self.baseUrl+request.urlPath,
            parameters: request.parameters,
            success:
            {
                (operation, responseObject) in
                successBlock(responseObject as! Dictionary<String, AnyObject>?)
            },
            failure:
            {
                (operation, error) in
                print("Error: " + error.localizedDescription)
                failureBlock(error.localizedDescription)
        })
        
    }
}
