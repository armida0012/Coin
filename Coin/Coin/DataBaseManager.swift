//
//  DataBaseManager.swift
//  Coin
//
//  Created by Арина on 15.06.18.
//  Copyright © 2018 Арина. All rights reserved.
//

import Foundation
import RealmSwift

class DataBaseManager {
    
    var realm : Realm!
    
    init() {
        realm = try! Realm()
    }
    
    func loadCoinList() -> Array<Coin> {
        var coins = Array<Coin>()
        for coin in realm.objects(Coin.self) {
            coins.append(coin)
        }
        return coins;
    }
    
    func writeCoinList(coinList: Array<Coin>) {
        for item in coinList {
            try! self.realm.write({
                self.realm.add(item, update: true)
            })
        }
        
    }
}
