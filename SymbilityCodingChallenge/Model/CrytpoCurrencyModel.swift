//
//  CrytpoCurrencyModel.swift
//  SymbilityCodingChallenge
//
//  Created by Niroop Prashant Belgaumkar  on 2018-06-02.
//  Copyright © 2018 Niroop Prashant Belgaumkar . All rights reserved.
//

import Foundation
import Alamofire

final class CryptoCurrencyModel {
    var cryptoNameList = [String]()
    var cryptoPriceList = [Float]()
    var cryptoNameTagList = [String]()
    var cryptoList : [CryptoCurrency]
    var cryptoPrice: String = ""
    
    init() {
        cryptoList = [CryptoCurrency]()
    }
    
    func getTheCryptoPrice(coinName: String, completed: @escaping DownloadComplete) {
        let strURL = "https://min-api.cryptocompare.com/data/price?fsym=\(coinName)&tsyms=CAD"
        Alamofire.request(strURL).responseJSON { [weak self] (response) in
            let result = response.result
            if let strongSelf = self, let dict = result.value as? Dictionary<String, AnyObject>, let price = dict["CAD"] {
                strongSelf.cryptoPrice = String(describing: price)
            }
            completed()
        }
    }
    
    func downloadTheCryptoNamesAndTags(completed: @escaping DownloadComplete) {
        Alamofire.request(coinListApiURL).responseJSON { (response) in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject>, let coinDict = dict["Data"] as? Dictionary<String, AnyObject> {
                for (key, value) in coinDict {
                    self.cryptoNameTagList.append(key)
                    if let coinDetails = value as? Dictionary<String, AnyObject>, let coinName = coinDetails["CoinName"] {
                        self.cryptoNameList.append(coinName as! String)
                    }
                }
            }
            completed()
        }
    }
    
    func getTheCryptoList(completed: @escaping DownloadCompleteWithArray){
        downloadTheCryptoNamesAndTags {
            var i = 0
            for tag in self.cryptoNameTagList {
                self.getTheCryptoPrice(coinName: tag, completed: {
                    let coinPrice = self.cryptoPrice
                    self.cryptoList.append(CryptoCurrency.init(self.cryptoNameList[i], coinPrice))
                    i += 1
                    if self.cryptoList.count == self.cryptoNameTagList.count {
                        completed(self.cryptoList)
                    }
                })
            }
        }
    
    }
}
