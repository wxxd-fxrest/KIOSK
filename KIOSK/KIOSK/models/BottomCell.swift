//
//  BottomCell.swift
//  AppleStore
//
//  Created by Seungseop Lee on 4/2/24.
//

import UIKit

class BottomCell: UITableViewCell {
    
    var deleteHandler: (() -> Void)?
    
    @IBOutlet weak var buyColorInCell: UIImageView!
    @IBOutlet weak var buyNameInCell: UILabel!
    @IBOutlet weak var buyCountInCell: UIButton!
    @IBOutlet weak var buyPriceInCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        buyColorInCell.layer.cornerRadius = buyColorInCell.frame.size.width / 2
        buyColorInCell.clipsToBounds = true
        buyCountInCell.tintColor = .black
        buyCountInCell.backgroundColor = .lightGray
        buyCountInCell.layer.cornerRadius = 5
        
    }
    
}
