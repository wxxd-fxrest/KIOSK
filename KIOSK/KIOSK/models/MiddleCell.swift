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
    @IBOutlet weak var cellPriceButtonView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupRoundedCorners()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupRoundedCorners()
        cellPriceButtonView.layer.cornerRadius = 12
    }
    
    private func setupRoundedCorners() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        black.layer.cornerRadius = 10
        black.layer.masksToBounds = true
    }
    
    private func setupTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(contentTapped))
        content.addGestureRecognizer(tapGesture)
        content.isUserInteractionEnabled = true
    }
    
    @objc func contentTapped() {
        print("Content View Tapped")
    }
}
