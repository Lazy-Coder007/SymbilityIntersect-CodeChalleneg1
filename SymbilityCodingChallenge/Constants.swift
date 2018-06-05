//
//  Constants.swift
//  SymbilityCodingChallenge
//
//  Created by Niroop Prashant Belgaumkar  on 2018-06-02.
//  Copyright © 2018 Niroop Prashant Belgaumkar . All rights reserved.
//

import Foundation


// API endpoints
let coinListApiURL : String = "https://www.cryptocompare.com/api/data/coinlist/"
let priceApiURL : String = "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=BTC,USD,EUR"


// Type Aliases
typealias DownloadComplete = () -> ()
typealias DownloadCompleteWithArray = ([CryptoCurrency]) -> ()
