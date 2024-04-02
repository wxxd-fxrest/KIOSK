//
//  BottomCell.swift
//  AppleStore
//
//  Created by Seungseop Lee on 4/2/24.
//

import UIKit

class BottomCell: UITableViewCell {
    
    @IBOutlet weak var buyColorInCell: UIImageView!
    @IBOutlet weak var buyNameInCell: UILabel!
    @IBOutlet weak var buyCountInCell: UIButton!
    @IBOutlet weak var buyPriceInCell: UILabel!
    
    func setup() {
        buyColorInCell.layer.cornerRadius = 15
    }
}
