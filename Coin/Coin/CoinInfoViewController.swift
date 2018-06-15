//
//  CoinInfoViewController.swift
//  Coin
//
//  Created by Арина on 14.06.18.
//  Copyright © 2018 Арина. All rights reserved.
//

import UIKit

class CoinInfoViewController: UITableViewController {        
    var coin:Coin = Coin()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell=UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "coincell")
        let quotes:Quotes = coin.quotes.first as Quotes!
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Symbol"
            cell.detailTextLabel?.text = coin.symbol
            break;
        case 1:
            cell.textLabel?.text = "Price"
            cell.detailTextLabel?.text = String(format: "%05.6f", quotes.price.floatValue) + " " + quotes.quotesSymbol
            break;
        case 2:
            cell.textLabel?.text = "Circulating supply"
            cell.detailTextLabel?.text = coin.circulating_supply.stringValue
            break;
        case 3:
            cell.textLabel?.text = "Last updated"
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEE, dd MMM yyyy hh:mm:ss +zzzz"
            dateFormatter.locale = Locale.init(identifier: "en_GB")
            dateFormatter.dateFormat = "MM-dd-yyyy"
            
            cell.detailTextLabel?.text = dateFormatter.string(from: coin.last_updated)
            break;
        case 4:
            cell.textLabel?.text = "Market cap"
            cell.detailTextLabel?.text = quotes.market_cap.stringValue + " " + quotes.quotesSymbol
            break;
        case 5:
            cell.textLabel?.text = "Change by 1 hour"
            cell.detailTextLabel?.text = quotes.percent_change_1h.stringValue + "%"
            break;
        case 6:
            cell.textLabel?.text = "Change by 24 hours"
            cell.detailTextLabel?.text = quotes.percent_change_24h.stringValue + "%"
            break;
        case 7:
            cell.textLabel?.text = "Change by week"
            cell.detailTextLabel?.text = quotes.percent_change_7d.stringValue + "%"
            break;
        case 8:
            cell.textLabel?.text = "Volume(24h)"
            cell.detailTextLabel?.text = quotes.volume_24h.stringValue + " " + quotes.quotesSymbol
            break;
        default:
            break;
        }
        
        return cell
    }
    
    
}
