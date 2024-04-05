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
        // 모서리 둥글게 설정
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        // 모서리 둥글게 설정
        black.layer.cornerRadius = 10
        black.layer.masksToBounds = true
    }
    
    private func setupTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(contentTapped))
        content.addGestureRecognizer(tapGesture)
        content.isUserInteractionEnabled = true // UIView는 기본적으로 사용자 상호작용이 비활성화되어 있으므로 활성화합니다.
    }
    
    @objc func contentTapped() {
        // content UIView가 탭되었을 때 수행할 작업
        print("Content View Tapped")
    }
}
