//
//  ViewController.swift
//  Coin
//
//  Created by Арина on 14.06.18.
//  Copyright © 2018 Арина. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    @IBOutlet weak var coinTableView: UITableView!
    private var _coinsArray : Array<Coin> = []
    let coinInfoSegueIdentifier = "CoinInfoSegue"
    
    var coinsArray : Array<Coin>{
        set {
            _coinsArray = newValue
            if coinTableView != nil {
                coinTableView.reloadData()
            }
        }
        get {
            return _coinsArray
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == coinInfoSegueIdentifier, let destination = segue.destination as? CoinInfoViewController, let coinIndex = coinTableView.indexPathForSelectedRow?.row {
            destination.coin = self.coinsArray[coinIndex]
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.coinTableView.delegate = self
        self.coinTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "coincell")
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        let coin:Coin = self.coinsArray[indexPath.row]
        cell.textLabel?.text = coin.symbol
        let quotes:Quotes = coin.quotes.first as Quotes!
        cell.detailTextLabel?.text = String(format: "%05.6f", quotes.price.floatValue) + " " + quotes.symbol
        cell.isUserInteractionEnabled = true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // pass any object as parameter, i.e. the tapped row
        performSegue(withIdentifier: coinInfoSegueIdentifier, sender: indexPath.row)
    }
    
}

