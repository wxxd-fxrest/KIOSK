//
//  ViewController.swift
//  AppleStore
//
//  Created by Seungseop Lee on 4/1/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    // 상단 4개의 버튼 카테고라이징 메소드
    @IBAction func didTappedCategoryBtn(_ sender: UIButton) {
        
        //버튼과 레이블을 튜플로 묶은것을 변수로 저장
        let buttonLabelPairs: [(UIButton, UILabel)] = [(macButton,macLabel),(iPhoneButton,iPhoneLabel),(iPadButton,iPadLabel),(watchButton,watchLabel)]
        
        // 버튼과 레이블을 흰색과 검은색으로 초기화
        buttonLabelPairs.forEach {
            $0.0.backgroundColor = .white
            $0.0.tintColor = .black
            $0.1.textColor = .black
        }
        
        // 선택된 버튼과 레이블의 튜플을 필터링하여 가져오기
        let selectedButtonLabelPair = buttonLabelPairs.filter { $0.0 == sender }
       
        // 선택된 버튼과 레이블의 색상을 검은색과 흰색으로 변경
        selectedButtonLabelPair[0].0.backgroundColor = .black
        selectedButtonLabelPair[0].0.tintColor = .white
        selectedButtonLabelPair[0].1.textColor = .white
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
    
    
    // 하단 4개의 버튼 카테고라이징 메소드
    @IBAction func didTappedProductBtn(_ sender: UIButton) {
        let productBtns: [UIButton] = [allButton, macBookButton, iMacButton, macMiniButton]
      
        // 모든 배경은 흰색, 텍스트는 검은색 초기화
        for button in productBtns {
            button.backgroundColor = UIColor.white
            button.titleLabel?.textColor = .black
        }
        
        // 선택된 버튼의 배경은 검은색, 텍스트는 흰색으로 설정
        sender.backgroundColor = UIColor.black
        sender.titleLabel?.textColor = .white
        //clicked
    }
    

    
    // 임시 데이터
    var itemArray: [appleItem] = [
        appleItem(name: "Mac Mini M2", variety: "iPad", price: 850000, color: "Black", count: 1),
        appleItem(name: "iPhone 15 Pro", variety: "iPhone", price: 1550000, color: "Green", count: 2)
    ]
    
    @IBOutlet weak var bottomTableView: UITableView!

    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var totalPrice: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

         
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BottomCell", for: indexPath) as! BottomCell
        
        cell.buyColorInCell.image = #imageLiteral(resourceName: "mango")
        cell.buyCountInCell.titleLabel?.text = String(itemArray[indexPath.row].count)
        cell.buyNameInCell.text = itemArray[indexPath.row].name
        cell.buyPriceInCell.text = "₩ \(itemArray[indexPath.row].price)"
        
        return cell
    }

    // 초기 설정
    func configureUI() {
        
        bottomTableView.dataSource = self
        bottomTableView.rowHeight = 18
        
        cancelButton.setTitle("취 소", for: .normal)
        cancelButton.layer.cornerRadius = 18
        // cancelButton.layer.borderWidth = 2.0
        cancelButton.tintColor = .black
        cancelButton.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        
        // 혹시 블랙으로 할건지?
        // cancelButton.layer.borderColor = UIColor.black.cgColor
        // cancelButton.layer.borderColor = UIColor.lightGray.cgColor
        
        payButton.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        payButton.tintColor = .black
        payButton.setTitle("결제하기", for: .normal)
        payButton.layer.cornerRadius = 18
        
        totalPrice.text = "₩ 0"
    }
    
    

    
    
    
    
    
    
    @IBAction func payButtonTapped(_ sender: UIButton) {
        // 얼럿 설정
        let alertController = UIAlertController(title: "결제", message: "모든 주문에 무료 배송 서비스가 제공됩니다.", preferredStyle: .alert)
        
        // "결제" 버튼 설정
        let payAction = UIAlertAction(title: "결제", style: .default)
        
        // "삭제" 버튼 설정
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        // alertController에 "추가"와 "취소" 버튼을 편성
        alertController.addAction(payAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        
        // 얼럿 설정
        let alertController = UIAlertController(title: "내역 삭제", message: "장바구니를 비웁니다.", preferredStyle: .alert)
        
        // "삭제" 버튼 설정
        let deleteAction = UIAlertAction(title: "삭제", style: .default) { _ in
            // Cell에 받은 데이터를 초기화하기
            self.itemArray.removeAll()
            self.bottomTableView.reloadData()
        }
        
        // "취소" 버튼 설정
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        // alertController에 "삭제"와 "취소" 버튼을 편성
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
}

