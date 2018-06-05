//
//  CryptoCurrency.swift
//  SymbilityCodingChallenge
//
//  Created by Niroop Prashant Belgaumkar  on 2018-06-02.
//  Copyright © 2018 Niroop Prashant Belgaumkar . All rights reserved.
//

import Foundation

final class CryptoCurrency {
    var coinName: String
    var coinPrice: String
    
    init(_ name: String, _ price: String) {
        coinName = name
        coinPrice = price
    }
}
