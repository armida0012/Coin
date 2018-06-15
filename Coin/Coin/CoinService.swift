//
//  ServiceLayer.swift
//  Coin
//
//  Created by Арина on 14.06.18.
//  Copyright © 2018 Арина. All rights reserved.
//

import Foundation

class CoinService {
    
    var  dataManager : DataManager
    
    init() {
        self.dataManager = DataManager.init(newBaseURL: APIConstants.baseURL);
    }
    
    func loadCoins(completion: @escaping(Array<Coin>)->Void,
                   errorCompletion: @escaping(String)->Void ) -> Void
    {
        let request : APIRequest = APIRequest.init(newUrlPath: APIConstants.tickers, newParameters: nil, newBodyItems: nil);
        dataManager.runRequest(request: request, successBlock:  {
            (result: Dictionary<String, AnyObject>?) in
            print(result)
            if result == nil || result!.count == 0 {
                errorCompletion("No coins")
            } else {
                completion(JSONParser.parsCoins(data: result!))
            }
            }, failureBlock: {
                (errorString: String?) in
                errorCompletion(errorString!)
        });
    }
}
