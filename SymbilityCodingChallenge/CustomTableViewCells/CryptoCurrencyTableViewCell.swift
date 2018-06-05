//
//  CryptoCurrencyTableViewCell.swift
//  SymbilityCodingChallenge
//
//  Created by Niroop Prashant Belgaumkar  on 2018-06-02.
//  Copyright © 2018 Niroop Prashant Belgaumkar . All rights reserved.
//

import UIKit

class CryptoCurrencyTableViewCell: UITableViewCell {

    @IBOutlet weak var cryptoNameLabel: UILabel!
    @IBOutlet weak var cryptoPriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
