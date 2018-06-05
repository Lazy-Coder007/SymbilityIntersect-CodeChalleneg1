//
//  CryptoCurrencyListTableViewController.swift
//  SymbilityCodingChallenge
//
//  Created by Niroop Prashant Belgaumkar  on 2018-06-02.
//  Copyright © 2018 Niroop Prashant Belgaumkar . All rights reserved.
//

import Foundation
import UIKit

class CryptoCurrencyListTableViewController: UITableViewController {
    
    // Properties
    var list = [CryptoCurrency]()
    var cryptoCurrencyModel = CryptoCurrencyModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "CryptoCurrencyTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        updateTheProperties()
    }
    
    func updateTheProperties() {
        cryptoCurrencyModel.getTheCryptoList { (_list) in
            self.list = _list
            self.tableView.reloadData()
        }
    }
}

extension CryptoCurrencyListTableViewController {
    // MARK : UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // default for now
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // default for now
//        if let customCell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? CryptoCurrencyTableViewCell {
//            let currency = list[indexPath.row]
//            customCell.cryptoNameLabel.text = currency.coinName
//            customCell.cryptoPriceLabel.text = "$" + currency.coinPrice
//            return customCell
//        }
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cryptoCell")
        let currency = list[indexPath.row]
        cell.textLabel?.text = currency.coinName
        cell.detailTextLabel?.text = "$" + currency.coinPrice
        return cell
    }
}

extension CryptoCurrencyListTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.moveRow(at: indexPath, to: IndexPath(row: 0, section: 0))
    }
}
