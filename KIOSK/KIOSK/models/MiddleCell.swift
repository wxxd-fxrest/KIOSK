//
//  midCell.swift
//  KIOSK
//
//  Created by damtea on 4/2/24.
//

import UIKit


class MiddleCell: UICollectionViewCell {
    
    @IBOutlet weak var white: UILabel!
    @IBOutlet weak var black: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var content: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupRoundedCorners()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupRoundedCorners()
    }
    
    private func setupRoundedCorners() {
        // 모서리 둥글게 설정
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        // 모서리 둥글게 설정
        black.layer.cornerRadius = 10
        black.layer.masksToBounds = true
    }
    
}
