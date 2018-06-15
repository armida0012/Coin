//
//  APIRequest.swift
//  Coin
//
//  Created by Арина on 14.06.18.
//  Copyright © 2018 Арина. All rights reserved.
//

import Foundation

class APIRequest {
    var urlPath : String = ""
    var parameters : [String : String]? = [:]
    var bodyItems : [String]? = []
    
    init(newUrlPath : String, newParameters : [String : String]?, newBodyItems : [String]?) {
        self.urlPath = newUrlPath;
        self.parameters = newParameters;
        self.bodyItems = newBodyItems;
    }
}
