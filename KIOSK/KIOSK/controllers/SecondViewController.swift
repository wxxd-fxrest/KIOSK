//
//  SecondViewController.swift
//  KIOSK
//
//  Created by 밀가루 on 4/2/24.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - Outlet | Image
    @IBOutlet weak var roundBackgroundView: UIView!
    @IBOutlet weak var bottomModalView: UIView!
    
    // MARK: - Outlet | Text
    @IBOutlet weak var titleUILabel: UILabel!
    @IBOutlet weak var priceUILabel: UILabel!
    @IBOutlet weak var colorSelectUILabel: UILabel!
    
    
    // MARK: - Outlet | Color Buttons
    @IBOutlet weak var starlightBackView: UIView!
    @IBOutlet weak var starlightView: UIView!
    
    @IBOutlet weak var silverBackVIew: UIView!
    @IBOutlet weak var silverView: UIView!
    
    @IBOutlet weak var spaceGrayBackView: UIView!
    @IBOutlet weak var spaceGrayView: UIView!
    
    @IBOutlet weak var midnightBackView: UIView!
    @IBOutlet weak var midnightView: UIView!
    
    // MARK: - Outlet | Quantity Button
    @IBOutlet weak var quantityBackView: UIView!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    // MARK: - Outlet | Basket Button
    @IBOutlet weak var BasketButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: BackGround
        if let backgroundColor = UIColor(named: "PageBackgroundColor") {
            view.backgroundColor = backgroundColor
        } else {
            // Fallback color if the named color is not found
            view.backgroundColor = UIColor.white
        }
        
        // MARK: - Navigation
        navigationController?.navigationBar.tintColor = UIColor(named: "BasicColor") // Change to your desired color
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        // MARK: - Image Set
        RoundbackgroundView(roundBackgroundView)
        
        
        // MARK: - Color Buttons
        makeViewRound(starlightBackView)
        makeViewRound(starlightView)
        
        makeViewRound(silverBackVIew)
        makeViewRound(silverView)
        
        makeViewRound(spaceGrayBackView)
        makeViewRound(spaceGrayView)
        
        makeViewRound(midnightBackView)
        makeViewRound(midnightView)
        
        makeViewRound(minusButton)
        makeViewRound(plusButton)

        minusButton.setTitle("", for: .normal)
        plusButton.setTitle("", for: .normal)
        
        quantityBackView.layer.cornerRadius = 20
        BasketButton.layer.cornerRadius = 20

        // MARK: - Bottom View
        bottomViewRound(bottomModalView, withRadius: 30.0)
        view.addSubview(bottomModalView)

        bottomModalView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomModalView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomModalView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomModalView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomModalView.heightAnchor.constraint(equalToConstant: 360) // Adjust height as needed
        ])
    }
    
    // MARK: - Image Set Controller
    func RoundbackgroundView(_ view: UIView) {
        // Make the view round
        view.layer.cornerRadius = view.frame.size.width / 2
        view.clipsToBounds = true
    }
    
    // MARK: - Bottom View Controller
    func bottomViewRound(_ view: UIView, withRadius radius: CGFloat) {
        // Make the view round with the specified radius
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
    }
    
    // MARK: - Color Buttons Controller
    func makeViewRound(_ view: UIView) {
        // Make the view round
        view.layer.cornerRadius = view.frame.size.width / 2
        view.clipsToBounds = true
    }
}
