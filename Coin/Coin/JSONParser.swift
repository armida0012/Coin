//
//  JSONParser.swift
//  Coin
//
//  Created by Арина on 14.06.18.
//  Copyright © 2018 Арина. All rights reserved.
//

import Foundation

class JSONParser {
    //TODO: для парсинга в идеале было бы сделать набор классов для JSON биндинга
    class func parsCoins(data: Dictionary<String, AnyObject>) -> Array<Coin> {
        var coinsArray:Array<Coin> = []
        if data["data"] != nil && data.count > 0 {
            var objectsDictionary : Dictionary<String, AnyObject> = (data["data"] as! Dictionary<String, AnyObject>)
            for key:String in objectsDictionary.keys {
                if objectsDictionary[key] != nil {
                    var descriptionDict:[String : AnyObject] = objectsDictionary[key] as! [String : AnyObject]
                    let coinObject:Coin = Coin()
                    coinObject.key = key
                    coinObject.last_updated = Date.init(timeIntervalSince1970: TimeInterval.init( (descriptionDict["last_updated"] as! NSNumber).stringValue)!)
                    coinObject.circulating_supply = descriptionDict["circulating_supply"] as! NSNumber
                    coinObject.symbol = (descriptionDict["symbol"])! as! String
                    
                    if descriptionDict["quotes"] != nil {
                        var quotesDict:[String : AnyObject] = descriptionDict["quotes"] as! [String : AnyObject]
                        if quotesDict.count > 0 {
                            for quotesCurrencyName in quotesDict.keys {
                                let quotesObject:Quotes = Quotes()
                                var quotesValues:[String : AnyObject] = quotesDict[quotesCurrencyName] as! [String : AnyObject]
                                
                                quotesObject.quotesSymbol = quotesCurrencyName
                                quotesObject.price = quotesValues["price"] as! NSNumber
                                quotesObject.market_cap = quotesValues["market_cap"] as! NSNumber
                                quotesObject.percent_change_1h = quotesValues["percent_change_1h"] as! NSNumber
                                quotesObject.percent_change_24h = quotesValues["percent_change_24h"] as! NSNumber
                                quotesObject.percent_change_7d = quotesValues["percent_change_7d"] as! NSNumber
                                quotesObject.volume_24h = quotesValues["volume_24h"] as! NSNumber
                                
                                coinObject.quotes.append(quotesObject)
                            }
                        }
                    }
                    coinsArray.append(coinObject)
                }
            }
        }
        return coinsArray
    }
}
