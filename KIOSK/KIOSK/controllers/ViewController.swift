//
//  ViewController.swift
//  AppleStore
//
//  Created by Seungseop Lee on 4/1/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, SecondViewControllerDelegate {
    var selectedbtn = 1
    var selectedbtn2 = 1

    @IBAction func didTappedCategoryBtn(_ sender: UIButton) {
        
        let buttonLabelPairs: [(UIButton, UILabel)] = [
            (macButton,macLabel),(iPhoneButton,iPhoneLabel),(iPadButton,iPadLabel),(watchButton,watchLabel)
        ]
        
        buttonLabelPairs.forEach {
            $0.0.backgroundColor = .white
            $0.0.tintColor = .black
            $0.1.textColor = .black
        }
        
        let selectedButtonLabelPair = buttonLabelPairs.filter { $0.0 == sender }
        
        selectedButtonLabelPair[0].0.backgroundColor = .black
        selectedButtonLabelPair[0].0.tintColor = .white
        selectedButtonLabelPair[0].1.textColor = .white
        
        if sender == macButton {
            selectedbtn = 1
            macMiniButton.isHidden = false
            allButton.setTitle("전체", for: .normal)
            macBookButton.setTitle("MacBook", for: .normal)
            iMacButton.setTitle("iMac", for: .normal)
            macMiniButton.setTitle("Mac Mini", for: .normal)
            didTappedProductBtn(allButton)
            
        } else if sender == iPhoneButton {
            selectedbtn = 2
            macMiniButton.isHidden = false
            allButton.setTitle("전체", for: .normal)
            macBookButton.setTitle("iPhone 15 Pro", for: .normal)
            iMacButton.setTitle("iPhone 15", for: .normal)
            macMiniButton.setTitle("iPhone SE", for: .normal)
            didTappedProductBtn(allButton)
            
        } else if sender == iPadButton {
            selectedbtn = 3
            macMiniButton.isHidden = false
            allButton.setTitle("전체", for: .normal)
            macBookButton.setTitle("iPad Air", for: .normal)
            iMacButton.setTitle("iPad", for: .normal)
            macMiniButton.setTitle("iPad Pro", for: .normal)
            didTappedProductBtn(allButton)
            
        } else if sender == watchButton{

            selectedbtn = 4
            allButton.setTitle("전체", for: .normal)
            macBookButton.setTitle("Series 9", for: .normal)
            iMacButton.setTitle("Ultra 2", for: .normal)
            macMiniButton.isHidden = true
            didTappedProductBtn(allButton)
            
        }
    }
    
    @IBOutlet weak var macButton: UIButton!
    @IBOutlet weak var iPhoneButton: UIButton!
    @IBOutlet weak var iPadButton: UIButton!
    @IBOutlet weak var watchButton: UIButton!
    
    @IBOutlet weak var macLabel: UILabel!
    @IBOutlet weak var iPhoneLabel: UILabel!
    @IBOutlet weak var iPadLabel: UILabel!
    @IBOutlet weak var watchLabel: UILabel!
    
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var macBookButton: UIButton!
    @IBOutlet weak var iMacButton: UIButton!
    @IBOutlet weak var macMiniButton: UIButton!
    
    
    @IBAction func didTappedProductBtn(_ sender: UIButton) {
        let productBtns: [UIButton] = [allButton, macBookButton, iMacButton, macMiniButton]
        
        for button in productBtns {
            button.backgroundColor = UIColor.white
            button.titleLabel?.textColor = .black
            button.setTitleColor(.black, for: .normal)
        }
        
        sender.backgroundColor = UIColor.black
        sender.setTitleColor(.white, for: .normal)
        sender.titleLabel?.textColor = .white
        
        let names = ["Mac", "iPhone", "iPad", "Watch"]
        
        switch sender {
            case allButton:
                chooseButton(variety: names[selectedbtn-1])
                break
            case macBookButton:
                chooseButton2(rank: 1, variety: names[selectedbtn-1])
                break
            case iMacButton:
                chooseButton2(rank: 2, variety: names[selectedbtn-1])
                break
            case macMiniButton:
                chooseButton2(rank: 3, variety: names[selectedbtn-1])
                break
            default:
                break
        }

        middleCollectionView.reloadData()
    }
        
    var itemArray: [appleItem] = []
    
    var newitemArray: [appleItem] = []
    var testitemArray: [appleItem] = []
    var myDataManager = DataManager()
    var midPageCount = 2
    
    @IBOutlet weak var middleCollectionView: UICollectionView!
    @IBOutlet weak var bottomTableView: UITableView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var bottomView: UIView!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        configureUIMid()
        configureUI()
        setupDatas()
        
        testitemArray = myDataManager.itemArray
        testitemArray = myDataManager.itemsColor(forVariety: "Midnight", arr: testitemArray)
        testitemArray = myDataManager.itemsVariety(forVariety: "Mac", arr: testitemArray)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BottomCell", for: indexPath) as! BottomCell
        
        let item = itemArray[indexPath.row]
        switch item.color {
        case "SilverColor":
            cell.buyColorInCell.image = UIImage(named: "silver")
        case "SpaceGrayColor":
            cell.buyColorInCell.image = UIImage(named: "space gray")
        case "StarLightColor":
            cell.buyColorInCell.image = UIImage(named: "starlight")
        case "MidnightColor":
            cell.buyColorInCell.image = UIImage(named: "midnight")
        default:
            cell.buyColorInCell.image = UIImage(named: "starlight")
        }
        
        let totalPriceForRow = item.price * item.count
        cell.buyPriceInCell.text = "₩ " + formatCurrency(amount: totalPriceForRow)!
        cell.buyCountInCell.setTitle(String(item.count), for: .normal)
        cell.buyNameInCell.text = item.name
        
        cell.buyColorInCell.layer.cornerRadius = cell.buyColorInCell.frame.height / 2
        cell.buyColorInCell.layer.masksToBounds = true
        cell.buyColorInCell.layer.borderWidth = 1.0
        cell.buyColorInCell.layer.borderColor = UIColor.gray.cgColor
        
        checkPaymentAvailability()
        
        return cell
        
    }
    
    func chooseButton(variety: String){
        testitemArray = myDataManager.itemArray
        testitemArray = myDataManager.itemsColor(forVariety: "Midnight", arr: testitemArray)
        testitemArray = myDataManager.itemsVariety(forVariety: variety, arr: testitemArray)
    }
    
    func chooseButton2(rank: Int, variety: String){
        testitemArray = myDataManager.itemArray
        testitemArray = myDataManager.itemsColor(forVariety: "Midnight", arr: testitemArray)
        testitemArray = myDataManager.itemsVariety(forVariety: variety, arr: testitemArray)
        testitemArray = myDataManager.itemsRank(forVariety: rank, arr: testitemArray)
    }
    
    func configureUIMid(){
        middleCollectionView.dataSource = self
        middleCollectionView.delegate = self
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "PageBackgroundColor")
        bottomView.backgroundColor =  UIColor(named: "PageBackgroundColor")
        bottomView.layer.cornerRadius = 10
        bottomTableView.dataSource = self
        bottomTableView.rowHeight = 32
        cancelButton.setTitle("취 소", for: .normal)
        cancelButton.layer.cornerRadius = 18
        cancelButton.tintColor = .black
        cancelButton.backgroundColor =  UIColor(named: "SilverColor")
        payButton.backgroundColor =  UIColor(named: "SilverColor")
        payButton.tintColor = .black
        payButton.setTitle("결제하기", for: .normal)
        payButton.layer.cornerRadius = 18
        totalPrice.text = "₩ 0"
    }
    
    func totalPriceUpdate() {
        var total = 0
        for item in itemArray {
            total += item.price * item.count
        }
        totalPrice.text = "₩ " + formatCurrency(amount: total)!
    }
    
    func formatCurrency(amount: Int) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: NSNumber(value: amount))
    }
    
    func didSelectBasket(with items: [appleItem]) {
        print("SecondViewController -> ViewController: \(items)")
        itemArray.append(contentsOf: items)
        bottomTableView.reloadData()
        totalPriceUpdate()
        checkPaymentAvailability()
      }
    
    func setupDatas() {
        myDataManager.makeItemData()
        newitemArray = myDataManager.getItemDate()
    }
    
    @IBAction func countButtonTapped(_ sender: UIButton) {
        
        guard let cell = sender.superview?.superview as? BottomCell else {
            return
        }
        
        guard let indexPath = bottomTableView.indexPath(for: cell) else {
            return
        }
        
        let currentCount = itemArray[indexPath.row].count
        let alertController = UIAlertController(title: "주문 수량 변경", message: "주문 수량을 변경하세요.", preferredStyle: .alert)
        
        let containerViewController = UIViewController()
        containerViewController.preferredContentSize = CGSize(width: 250, height: 150)
        alertController.setValue(containerViewController, forKey: "contentViewController")
        
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 150))
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.selectRow(currentCount - 1, inComponent: 0, animated: false)
        containerViewController.view.addSubview(pickerView)
        
        let confirmAction = UIAlertAction(title: "확인", style: .default) { action in
            let selectedRow = pickerView.selectedRow(inComponent: 0)
            let newCount = selectedRow + 1
            if (1...10).contains(newCount) {
                self.itemArray[indexPath.row].count = newCount
                self.bottomTableView.reloadData()
                self.totalPriceUpdate()
            }
        }
        
        alertController.addAction(confirmAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        guard let cell = sender.superview?.superview as? BottomCell,
              let indexPath = bottomTableView.indexPath(for: cell) else {
            return
        }
        
        itemArray.remove(at: indexPath.row)
        
        bottomTableView.deleteRows(at: [indexPath], with: .automatic)
        
        totalPriceUpdate()
        
        checkPaymentAvailability()
    }
    
    @IBAction func payButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "결제", message: "주문하신 상품으로 결제가 진행됩니다.", preferredStyle: .alert)
        
        let payAction = UIAlertAction(title: "결제", style: .default) { _ in
            let successAlertController = UIAlertController(title: "결제 완료", message: "결제가 완료되었습니다.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "확인", style: .default) { _ in
                self.itemArray.removeAll()
                self.bottomTableView.reloadData()
                self.totalPriceUpdate()
                self.checkPaymentAvailability()
                self.configureUI()
            }
            
            successAlertController.addAction(okAction)
            self.present(successAlertController, animated: true)
        }
        
        alertController.addAction(payAction)
        
        present(alertController, animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "내역 삭제", message: "장바구니를 비웁니다.", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "삭제", style: .default) { _ in
            self.itemArray.removeAll()
            self.bottomTableView.reloadData()
            self.totalPriceUpdate()
            self.checkPaymentAvailability()
            self.configureUI()
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let indexPath = bottomTableView.indexPathForSelectedRow else {
            return
        }

        var selectedItem = itemArray[indexPath.row]

        let newCount = row + 1
        selectedItem.count = newCount
        itemArray[indexPath.row] = selectedItem
        bottomTableView.reloadRows(at: [indexPath], with: .automatic)
        totalPriceUpdate()
        checkPaymentAvailability()
    }
    
    func checkPaymentAvailability() {
        print(itemArray)
        
        if itemArray.isEmpty {
            cancelButton.isEnabled = false
            payButton.isEnabled = false
            payButton.backgroundColor = UIColor.lightGray
            payButton.setTitleColor(.black, for: .normal)
            
        } else {
            cancelButton.isEnabled = true
            payButton.isEnabled = true
            payButton.backgroundColor = .black
            payButton.setTitleColor(.white, for: .normal)

        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testitemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MiddleCell", for: indexPath) as? MiddleCell else {
            fatalError("Unable to dequeue MyCustomCell")
        }
        
        guard indexPath.row < testitemArray.count else {
            return cell
        }
        
        let item = testitemArray[indexPath.row]
                
        cell.black.text = "₩ " + formatCurrency(amount: item.price)!
        cell.white.text = item.name
        
        guard let image = UIImage(named: item.name) else {
            print("Image named \(item.name) not found, setting default image")
            cell.image.image = UIImage(named: "DefaultImage")
            return cell
        }
        
        cell.image.image = image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MiddleCell  else {
            return
        }
        
        let useArr = myDataManager.itemsName(forVariety: cell.white.text ?? "", arr: testitemArray)
        print(useArr, "내용확인")
        
        let storyboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        if let destinationVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            destinationVC.itemArray = useArr
            
            destinationVC.modalPresentationStyle = .automatic
            destinationVC.delegate = self
            
            self.present(destinationVC, animated: true, completion: nil)
        }
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .vertical
        let itemWidth = (self.middleCollectionView.frame.width - 8) / 2
        layout.itemSize = CGSize(width: itemWidth, height: 180)
        self.middleCollectionView.collectionViewLayout = layout
    }
}




