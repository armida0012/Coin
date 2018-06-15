//
//  AppDelegate.swift
//  Coin
//
//  Created by Арина on 14.06.18.
//  Copyright © 2018 Арина. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let bdLastUpdateKey = "bdLastUpdate"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let conService : CoinService = CoinService()
        let dbManager:DataBaseManager = DataBaseManager()
        let defaults = UserDefaults.standard
        let list : Array<Coin> = dbManager.loadCoinList()
        var bdLastUpdate:Date = Date.init(timeIntervalSince1970: TimeInterval.init(0))
        
        let navigationController:UINavigationController = self.window!.rootViewController as! UINavigationController;
        let coinListViewController:ViewController = navigationController.topViewController as! ViewController;
        
        if defaults.string(forKey: bdLastUpdateKey) != nil {
            bdLastUpdate = Date.init(timeIntervalSince1970: TimeInterval.init(defaults.string(forKey: bdLastUpdateKey)!)!)
        }
        
        if(Date().timeIntervalSince1970 - bdLastUpdate.timeIntervalSince1970 > 60*60*12)
        {
            defaults.set(Date().timeIntervalSince1970, forKey: bdLastUpdateKey)
            defaults.synchronize()
        
            conService.loadCoins(completion: {
                (result: Array<Coin>) in
                coinListViewController.coinsArray = result;
                dbManager.writeCoinList(coinList: result)
            }, errorCompletion:
            {
                (errorString: String) in
                let alert = UIAlertController(title: "No data", message: errorString, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                coinListViewController.present(alert, animated: true, completion: nil)
            }
        );
        } else {
            coinListViewController.coinsArray = list;
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

