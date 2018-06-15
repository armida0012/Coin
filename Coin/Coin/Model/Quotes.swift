//
//  Quotes.swift
//  Coin
//
//  Created by Арина on 15.06.18.
//  Copyright © 2018 Арина. All rights reserved.
//

import RealmSwift

class Quotes : Object {
    dynamic var key: String = NSUUID().uuidString
    dynamic var quotesSymbol : String = ""
    dynamic var price : NSNumber = NSNumber.init(value: 0.0)
    
    dynamic var percent_change_1h : NSNumber = NSNumber.init(value: 0.0)
    dynamic var percent_change_24h : NSNumber = NSNumber.init(value: 0.0)
    dynamic var percent_change_7d : NSNumber = NSNumber.init(value: 0.0)
    dynamic var volume_24h : NSNumber = NSNumber.init(value: 0.0)
    dynamic var market_cap : NSNumber = NSNumber.init(value: 0.0)
    
    override static func primaryKey() -> String? {
        return "key"
    }
}
