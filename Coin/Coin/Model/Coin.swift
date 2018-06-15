//
//  File.swift
//  Coin
//
//  Created by Арина on 14.06.18.
//  Copyright © 2018 Арина. All rights reserved.
//

import RealmSwift

class Coin : Object {
    dynamic var key: String = NSUUID().uuidString
    dynamic var symbol : String = ""
    dynamic var currency : String = ""
    dynamic var last_updated : Date = Date.init()
    dynamic var circulating_supply : NSNumber = NSNumber.init(value: 0.0)
    var quotes : List<Quotes> = List<Quotes>()
    override static func primaryKey() -> String? {
        return "key"
    }
}
