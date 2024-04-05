//
//  SecondViewController.swift
//  KIOSK
//
//  Created by 밀가루 on 4/2/24.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func didSelectBasket(with items: [appleItem])
}

class SecondViewController: UIViewController {
    weak var delegate: SecondViewControllerDelegate?

    
    // MARK: - Data
    var itemArray: [appleItem] = [
        appleItem(name: "iPad Air", variety: "iPad", price: 850000, color: "StarLightColor", count: 1, rank: 1)
    ]
    
    
    // MARK: - Outlet | Image
    @IBOutlet weak var roundBackgroundView: UIView!
    @IBOutlet weak var bottomModalView: UIView!
    @IBOutlet weak var itemImage: UIImageView!
    
    
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
    
    
    // MARK: - Outlet | Quantity
    @IBOutlet weak var quantityBackView: UIView!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var QuantityLabel: UILabel!
    
    
    // MARK: - Outlet | Basket Button
    @IBOutlet weak var BasketButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: BackGround
        if let backgroundColor = UIColor(named: "PageBackgroundColor") {
            view.backgroundColor = backgroundColor
        } else {
            view.backgroundColor = UIColor.white
        }
        
        
        // MARK: - Navigation
        navigationController?.navigationBar.tintColor = UIColor(named: "BasicColor")
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        
        // MARK: - Image Set
        RoundbackgroundView(roundBackgroundView)
        
        
        // MARK: - Color Buttons Shadow & Color
        if let selectedColor = itemArray.first?.color {
            addBorderToSelectedColorView(selectedColor)
        } else {
            addBorderToSelectedColorView("StarLightColor")
        }
        
        makeViewRound(starlightBackView)
        makeViewRound(starlightView)
        starlightView.backgroundColor = UIColor(named: "StarLightColor")

        makeViewRound(silverBackVIew)
        makeViewRound(silverView)
        silverView.backgroundColor = UIColor(named: "SilverColor")

        makeViewRound(spaceGrayBackView)
        makeViewRound(spaceGrayView)
        spaceGrayView.backgroundColor = UIColor(named: "SpaceGrayColor")

        makeViewRound(midnightBackView)
        makeViewRound(midnightView)
        midnightView.backgroundColor = UIColor(named: "MidnightColor")

        addShadow(to: starlightView)
        addShadow(to: silverView)
        addShadow(to: spaceGrayView)
        addShadow(to: midnightView)
        
        addTapGesture(to: starlightView, withColor: "StarLightColor")
        addTapGesture(to: silverView, withColor: "SilverColor")
        addTapGesture(to: spaceGrayView, withColor: "SpaceGrayColor")
        addTapGesture(to: midnightView, withColor: "MidnightColor")
        

        // MARK: - Bottom Buttons
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
            bottomModalView.heightAnchor.constraint(equalToConstant: 360)
        ])
        
        if !itemArray.isEmpty {
            let selectItem = itemArray[0]
            let itemName = selectItem.name
            titleUILabel.text = selectItem.name
            
            if let formattedPrice = formatCurrency(amount: selectItem.price) {
                priceUILabel.text = "₩" + formattedPrice
            }
            
            if let image = getImage(for: itemName) {
              itemImage.image = image
            }
        }
        
        minusButton.addTarget(self, action: #selector(decrementQuantity), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(incrementQuantity), for: .touchUpInside)
    }
    
    func addBorderToSelectedColorView(_ colorName: String) {
        switch colorName {
        case "StarLightColor":
            starlightBackView.layer.borderWidth = 1.0
            starlightBackView.layer.borderColor = UIColor(named: "SpaceGrayColor")?.cgColor
        case "SilverColor":
            silverBackVIew.layer.borderWidth = 1.0
            silverBackVIew.layer.borderColor = UIColor(named: "SpaceGrayColor")?.cgColor
        case "SpaceGrayColor":
            spaceGrayBackView.layer.borderWidth = 1.0
            spaceGrayBackView.layer.borderColor = UIColor(named: "SpaceGrayColor")?.cgColor
        case "MidnightColor":
            midnightBackView.layer.borderWidth = 1.0
            midnightBackView.layer.borderColor = UIColor(named: "SpaceGrayColor")?.cgColor
        default:
            break
        }
    }
    
    // MARK: - Image Set Controller
    func RoundbackgroundView(_ view: UIView) {
        view.layer.cornerRadius = view.frame.size.width / 2
        view.clipsToBounds = true
    }
    
    
    // MARK: - Bottom View Controller
    func bottomViewRound(_ view: UIView, withRadius radius: CGFloat) {
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
    }
    
    
    // MARK: - Color Buttons Controller
    func makeViewRound(_ view: UIView) {
        view.layer.cornerRadius = view.frame.size.width / 2
        view.clipsToBounds = true
    }

    
    // MARK: - Button Shadow
    func addShadow(to view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 1
        view.layer.shadowOpacity = 0.6
    }
    
    
    // MARK: - Item 이름에 맞는 이미지 매칭
    private func getImage(for itemName: String) -> UIImage? {
        return UIImage(named: itemName)
    }
    
    
    // MARK: - Price formatter
    func formatCurrency(amount: Int) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "ko_KR") // 한국 로케일로 설정 (콤마 사용)
        return formatter.string(from: NSNumber(value: amount))
    }
    
    
    // MARK: - Color Button Tap
    func addTapGesture(to view: UIView, withColor colorName: String) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(colorViewTapped(_:)))
        view.addGestureRecognizer(tapGesture)
        view.accessibilityIdentifier = colorName // 색상 뷰에 accessibilityIdentifier 설정
        makeViewRound(view)
    }

    @objc func colorViewTapped(_ sender: UITapGestureRecognizer) {
        guard let selectedColorView = sender.view else {
            return
        }
        
        resetBorderForAllColorViews()
        
        // 색상 뷰의 accessibilityIdentifier를 사용하여 선택된 색상 식별
        if let selectedColorName = selectedColorView.accessibilityIdentifier {
            switch selectedColorName {
            case "StarLightColor":
                starlightBackView.layer.borderWidth = 1.0
                starlightBackView.layer.borderColor = UIColor(named: "SpaceGrayColor")?.cgColor
            case "SilverColor":
                silverBackVIew.layer.borderWidth = 1.0
                silverBackVIew.layer.borderColor = UIColor(named: "SpaceGrayColor")?.cgColor
            case "SpaceGrayColor":
                spaceGrayBackView.layer.borderWidth = 1.0
                spaceGrayBackView.layer.borderColor = UIColor(named: "SpaceGrayColor")?.cgColor
            case "MidnightColor":
                midnightBackView.layer.borderWidth = 1.0
                midnightBackView.layer.borderColor = UIColor(named: "SpaceGrayColor")?.cgColor
            default:
                break
            }
            
            // 선택된 색상을 itemArray에 반영
            if let index = itemArray.firstIndex(where: { $0.color != selectedColorName }) {
                itemArray[index].color = selectedColorName
                print("Item with color \(selectedColorName) updated: \(itemArray[index])")
            }
        }
    }


    func resetBorderForAllColorViews() {
        starlightBackView.layer.borderWidth = 0
        silverBackVIew.layer.borderWidth = 0
        spaceGrayBackView.layer.borderWidth = 0
        midnightBackView.layer.borderWidth = 0
    }

    
    // MARK: - Quantity change
    @objc func decrementQuantity() {
        guard !itemArray.isEmpty else { return }
        if itemArray[0].count > 1 {
            itemArray[0].count -= 1
            QuantityLabel.text = "\(itemArray[0].count)"
            print("\(itemArray[0].count)")
            print("updated: \(itemArray[0])")
        }
    }

    @objc func incrementQuantity() {
        guard !itemArray.isEmpty else { return }
        itemArray[0].count += 1
        QuantityLabel.text = "\(itemArray[0].count)"
        print("\(itemArray[0].count)")
        print("updated: \(itemArray[0])")
    }
    
    
//    // MARK: - Basket Button Pressed
//    @IBAction func basketButtonPressed(_ sender: UIButton) {
//        // Deliver the items to the delegate
//        delegate?.didSelectBasket(with: itemArray)
//
//        // Dismiss the presented view controller with a custom transition
//        dismissModalViewControllerWithAnimation()
//    }
    
    @IBAction func basketButtonPressed(_ sender: UIButton) {
        delegate?.didSelectBasket(with: itemArray) // Pass the itemArray to the delegate
        dismiss(animated: true, completion: nil) // Dismiss the SecondViewController
    }

    private func dismissModalViewControllerWithAnimation() {
        UIView.animate(withDuration: 0.3, animations: {
            // Move the modal view controller downward
            self.view.frame = CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.size.width, height: self.view.frame.size.height)
        }) { (finished) in
            // Dismiss the modal view controller after the animation completes
            self.dismiss(animated: false, completion: nil)
        }
    }
}
