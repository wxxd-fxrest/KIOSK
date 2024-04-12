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
    var itemArray: [appleItem] = []
    
    
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

    
    // MARK: - Life Cycle
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
        
        itemImage.layer.shadowColor = UIColor.black.cgColor
        itemImage.layer.shadowOpacity = 0.5
        itemImage.layer.shadowOffset = CGSize(width: 0, height: 2)
        itemImage.layer.shadowRadius = 4
        
        
        // MARK: - Color Buttons Shadow & Color
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
        
        // Set initial border for the "starlight" color view
        addBorderToSelectedColorView("StarLightColor")
    }
    
    
    // MARK: - Image Set Controller
    func RoundbackgroundView(_ view: UIView) {
        view.layer.cornerRadius = view.frame.size.width / 2
        view.clipsToBounds = false // Allow shadow to be visible outside bounds
        
        // Add shadow
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowRadius = 2
    }
    

    // MARK: - Bottom View Controller
    func bottomViewRound(_ view: UIView, withRadius radius: CGFloat) {
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: -4)
        view.layer.shadowRadius = 4
        view.layer.masksToBounds = false
        
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: radius).cgPath
    }
    
    
    // MARK: - Color Buttons Controller
    func makeViewRound(_ view: UIView) {
        view.layer.cornerRadius = view.frame.size.width / 2
        view.clipsToBounds = true
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
        view.tag = colorName.hash
        makeViewRound(view)
    }

    @objc func colorViewTapped(_ sender: UITapGestureRecognizer) {
        guard let selectedColorView = sender.view else {
            return
        }

        resetBorderForAllColorViews()

        switch selectedColorView {
        case starlightView:
            addBorderToSelectedColorView("StarLightColor")
        case silverView:
            addBorderToSelectedColorView("SilverColor")
        case spaceGrayView:
            addBorderToSelectedColorView("SpaceGrayColor")
        case midnightView:
            addBorderToSelectedColorView("MidnightColor")
        default:
            break
        }

        guard let selectedColorName = selectedColorView.accessibilityIdentifier else {
            return
        }
        print("Item with color \(selectedColorName)")

        if let index = itemArray.firstIndex(where: { $0.color != selectedColorName }) {
            itemArray[index].color = selectedColorName
            print("Item with color \(selectedColorName) updated: \(itemArray[index])")
        }
    }

    func addBorderToSelectedColorView(_ colorName: String) {
        UIView.animate(withDuration: 0.3) {
            switch colorName {
            case "StarLightColor":
                self.starlightBackView.layer.borderWidth = 1.0
                self.starlightBackView.layer.borderColor = UIColor(named: "SpaceGrayColor")?.cgColor
                self.roundBackgroundView.backgroundColor = UIColor(named: "StarLightColor")
                self.roundBackgroundView.alpha = 1.0
            case "SilverColor":
                self.silverBackVIew.layer.borderWidth = 1.0
                self.silverBackVIew.layer.borderColor = UIColor(named: "SpaceGrayColor")?.cgColor
                self.roundBackgroundView.backgroundColor = UIColor(named: "SilverColor")
                self.roundBackgroundView.alpha = 1.0
            case "SpaceGrayColor":
                self.spaceGrayBackView.layer.borderWidth = 1.0
                self.spaceGrayBackView.layer.borderColor = UIColor(named: "SpaceGrayColor")?.cgColor
                self.roundBackgroundView.backgroundColor = UIColor(named: "SpaceGrayColor")?.withAlphaComponent(0.5) // Adjust opacity here
            case "MidnightColor":
                self.midnightBackView.layer.borderWidth = 1.0
                self.midnightBackView.layer.borderColor = UIColor(named: "SpaceGrayColor")?.cgColor
                self.roundBackgroundView.backgroundColor = UIColor(named: "MidnightColor")?.withAlphaComponent(0.5) // Adjust opacity here
            default:
                break
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
    
    
    // MARK: - Basket Button Pressed
    @IBAction func basketButtonPressed(_ sender: UIButton) {
        print(itemArray, "전달전")
        delegate?.didSelectBasket(with: itemArray)
        self.dismiss(animated: true, completion: nil)
    }
    
}
