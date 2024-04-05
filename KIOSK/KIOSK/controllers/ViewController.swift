//
//  ViewController.swift
//  AppleStore
//
//  Created by Seungseop Lee on 4/1/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    // ******* 나연님 코드 *******
    
    var selectedbtn = 1
    var selectedbtn2 = 1
    //var arrToUseCell = myDataManager.Mac
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
        if sender == macButton{
            //mac 버튼 눌림
            //print("mac 버튼 눌림")
            selectedbtn = 1
            macMiniButton.isHidden = false
            allButton.setTitle("전체", for: .normal)
            macBookButton.setTitle("MacBook", for: .normal)
            iMacButton.setTitle("iMac", for: .normal)
            macMiniButton.setTitle("Mac Mini", for: .normal)
            didTappedProductBtn(allButton)
            
            
        }else if sender == iPhoneButton{
            //phone 버튼 눌림
            //print("iphone 버튼 눌림")
            selectedbtn = 2
            macMiniButton.isHidden = false
            allButton.setTitle("전체", for: .normal)
            macBookButton.setTitle("iPhone 15 Pro", for: .normal)
            iMacButton.setTitle("iPhone 15", for: .normal)
            macMiniButton.setTitle("iPhone SE", for: .normal)
            didTappedProductBtn(allButton)
            
            
        }else if sender == iPadButton{
            //pad 버튼 눌림
            //print("ipad 버튼 눌림")
            selectedbtn = 3
            macMiniButton.isHidden = false
            allButton.setTitle("전체", for: .normal)
            macBookButton.setTitle("iPad Air", for: .normal)
            iMacButton.setTitle("iPad", for: .normal)
            macMiniButton.setTitle("iPad Pro", for: .normal)
            didTappedProductBtn(allButton)
            
            
        }else if sender == watchButton{
            //watch 버튼 눌림
            //print("watch 버튼 눌림")
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
    
    
    // 하단 4개의 버튼 카테고라이징 메소드
    @IBAction func didTappedProductBtn(_ sender: UIButton) {
        let productBtns: [UIButton] = [allButton, macBookButton, iMacButton, macMiniButton]
        
        // 모든 배경은 흰색, 텍스트는 검은색 초기화
        for button in productBtns {
            button.backgroundColor = UIColor.white
            button.titleLabel?.textColor = .black
            button.setTitleColor(.black, for: .normal)
        }
        
        // 선택된 버튼의 배경은 검은색, 텍스트는 흰색으로 설정
        sender.backgroundColor = UIColor.black
        sender.setTitleColor(.white, for: .normal)
        sender.titleLabel?.textColor = .white
        
        //clicked
        if(sender==allButton){
            if(selectedbtn==1){
                print("Mac 전체")
                testitemArray = myDataManager.itemArray
                testitemArray = myDataManager.itemsColor(forVariety: "Midnight", arr: testitemArray)
                testitemArray = myDataManager.itemsVariety(forVariety: "Mac", arr: testitemArray)
              
            }else if(selectedbtn==2){
                print("iPhone 전체")
                testitemArray = myDataManager.itemArray
                testitemArray = myDataManager.itemsColor(forVariety: "Midnight", arr: testitemArray)
                testitemArray = myDataManager.itemsVariety(forVariety: "iPhone", arr: testitemArray)
                
            }else if(selectedbtn==3){
                print("iPad 전체")
                testitemArray = myDataManager.itemArray
                testitemArray = myDataManager.itemsColor(forVariety: "Midnight", arr: testitemArray)
                testitemArray = myDataManager.itemsVariety(forVariety: "iPad", arr: testitemArray)
                
            }else if(selectedbtn==4){
                print("Watch 전체")
            }
        }else if(sender == macBookButton){
            if(selectedbtn==1){
                print("MacBook")
                
            }else if(selectedbtn==2){
                print("iPhone 15 Pro")
                
            }else if(selectedbtn==3){
                print("iPad Air")
                
            }else if(selectedbtn==4){
                print("Series 9")
                
            }
        }else if(sender == iMacButton){
            if(selectedbtn==1){
                print("iMac")
                
            }else if(selectedbtn==2){
                print("iPhone 15")
                
            }else if(selectedbtn==3){
                print("iPad")
                
            }else if(selectedbtn==4){
                print("Ultra 2")
                
            }
        }else if(sender == macMiniButton){
            if(selectedbtn==1){
                print("Mac Mini")
                
            }else if(selectedbtn==2){
                print("iPhone SE")
                
            }else if(selectedbtn==3){
                print("iPad Pro")
                
                
            }else if(selectedbtn==4){
                //print("Mac Mini")
            }
        }
        //middleCollectionView.reloadData()
    }
    
    // ******* 나연님 코드 *******
    
    // 임시 데이터
    var itemArray: [appleItem] = [
        appleItem(name: "Mac Mini M2", variety: "iPad", price: 850000, color: "Silver", count: 1, rank: 1),
        appleItem(name: "Mac Mini M2", variety: "iPad", price: 850000, color: "Silver", count: 1, rank: 1),
        appleItem(name: "Mac Mini M2", variety: "iPad", price: 850000, color: "Silver", count: 1, rank: 1),
        appleItem(name: "Mac Mini M2", variety: "iPad", price: 850000, color: "Silver", count: 1, rank: 1)
    ]
    
    
    //테스트 공간
    var newitemArray: [appleItem] = []
    var testitemArray: [appleItem] = []
    var myDataManager = DataManager()
    var midPageCount = 2
    
    //middleCollectionView
    @IBOutlet weak var middleCollectionView: UICollectionView!
    
    
    @IBOutlet weak var bottomTableView: UITableView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var bottomView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIMid()
        configureUI()
        setupDatas()
        
        testitemArray = myDataManager.itemArray
        testitemArray = myDataManager.itemsColor(forVariety: "Midnight", arr: testitemArray)
        testitemArray = myDataManager.itemsVariety(forVariety: "Mac", arr: testitemArray)
        for i in testitemArray {
            print(i, i.name)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BottomCell", for: indexPath) as! BottomCell
        
        // color에 따라 이미지 설정
        let item = itemArray[indexPath.row]
        
        switch item.color {
        case "Silver":
            cell.buyColorInCell.image = UIImage(named: "silver")
        case "Space Gray":
            cell.buyColorInCell.image = UIImage(named: "space gray")
        case "Starlight":
            cell.buyColorInCell.image = UIImage(named: "starlight")
        case "Midnight":
            cell.buyColorInCell.image = UIImage(named: "midnight")
        default:
            // 기본 이미지 설정
            cell.buyColorInCell.image = UIImage(named: "mango")
        }
        
        let totalPriceForRow = item.price * item.count
        cell.buyPriceInCell.text = "₩ " + formatCurrency(amount: totalPriceForRow)!
        cell.buyCountInCell.setTitle(String(item.count), for: .normal)
        cell.buyNameInCell.text = item.name
        
        // cell의 buyColorInCell 이미지뷰를 원형으로 설정
        cell.buyColorInCell.layer.cornerRadius = cell.buyColorInCell.frame.height / 2
        cell.buyColorInCell.layer.masksToBounds = true
        
        // 결제 가능 여부 확인
        checkPaymentAvailability()
        
        return cell
        
    }
    func configureUIMid(){
        middleCollectionView.dataSource = self
    }
    
    // 초기 설정
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
    
    // 합계 금액 업데이트 매서드
    func totalPriceUpdate() {
        var total = 0
        for item in itemArray {
            total += item.price * item.count
        }
        totalPrice.text = "₩ " + formatCurrency(amount: total)!
    }
    
    // 세 자리 수마다 콤마 찍기
    func formatCurrency(amount: Int) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "ko_KR") // 한국 로케일로 설정 (콤마 사용)
        return formatter.string(from: NSNumber(value: amount))
    }
    
    
    func setupDatas() {
        //수정하기
        myDataManager.makeItemData()
        newitemArray = myDataManager.getItemDate()
    }
    
    // 갯수 버튼 누르면
    @IBAction func countButtonTapped(_ sender: UIButton) {
        
        guard let cell = sender.superview?.superview as? BottomCell else {
            return
        }
        
        // 셀의 인덱스를 가져옵니다.
        guard let indexPath = bottomTableView.indexPath(for: cell) else {
            return
        }
        
        // 현재 주문 수량을 가져옵니다.
        let currentCount = itemArray[indexPath.row].count
        
        // 얼럿 컨트롤러 생성
        let alertController = UIAlertController(title: "주문 수량 변경", message: "주문 수량을 변경하세요.", preferredStyle: .alert)
        
        // UIViewController를 생성하여 추가합니다.
        let containerViewController = UIViewController()
        containerViewController.preferredContentSize = CGSize(width: 250, height: 150)
        alertController.setValue(containerViewController, forKey: "contentViewController")
        
        // UIPicker 생성
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 150))
        pickerView.dataSource = self
        pickerView.delegate = self
        // 현재 주문 수량을 선택된 값으로 설정
        pickerView.selectRow(currentCount - 1, inComponent: 0, animated: false)
        
        // 얼럿 컨트롤러에 피커뷰를 추가합니다.
        containerViewController.view.addSubview(pickerView)
        
        // "확인" 액션 추가
        let confirmAction = UIAlertAction(title: "확인", style: .default) { action in
            // 변경된 주문 수량을 피커뷰에서 가져옴
            let selectedRow = pickerView.selectedRow(inComponent: 0)
            let newCount = selectedRow + 1
            // 아이템의 주문 수량이 1부터 10까지인 경우에만 변경
            if (1...10).contains(newCount) {
                // 아이템의 주문 수량 변경
                self.itemArray[indexPath.row].count = newCount
                // 테이블 뷰 리로드하여 변경 사항 반영
                self.bottomTableView.reloadData()
                // 총 가격 업데이트
                self.totalPriceUpdate()
            }
        }
        alertController.addAction(confirmAction)
        
        // "취소" 액션 추가
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alertController.addAction(cancelAction)
        
        // 얼럿 창 표시
        present(alertController, animated: true)
        
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        guard let cell = sender.superview?.superview as? BottomCell,
              let indexPath = bottomTableView.indexPath(for: cell) else {
            return
        }
        
        // 해당 셀의 아이템을 배열에서 제거
        itemArray.remove(at: indexPath.row)
        
        // 테이블 뷰에서 해당 셀을 제거
        bottomTableView.deleteRows(at: [indexPath], with: .automatic)
        
        // 최종 가격 업데이트
        totalPriceUpdate()
        
        // 결제 가능 여부 확인
        checkPaymentAvailability()
    }
    
    @IBAction func payButtonTapped(_ sender: UIButton) {
        // 얼럿 설정
        let alertController = UIAlertController(title: "결제", message: "주문하신 상품으로 결제가 진행됩니다.", preferredStyle: .alert)
        
        // "결제" 버튼 설정
        let payAction = UIAlertAction(title: "결제", style: .default) { _ in
            // 결제 완료 얼럿 설정
            let successAlertController = UIAlertController(title: "결제 완료", message: "결제가 완료되었습니다.", preferredStyle: .alert)
            
            // "확인" 버튼 설정
            let okAction = UIAlertAction(title: "확인", style: .default) { _ in
                // 배열을 완전히 비워줍니다.
                self.itemArray.removeAll()
                // 테이블 뷰를 다시 로드하여 빈 상태를 반영합니다.
                self.bottomTableView.reloadData()
                // 최종 가격 업데이트
                self.totalPriceUpdate()
                // 결제 가능 여부 확인
                self.checkPaymentAvailability()
                // UI 초기화
                self.configureUI()
            }
            
            // 성공 얼럿에 "확인" 액션 추가
            successAlertController.addAction(okAction)
            
            // 결제 완료 얼럿 표시
            self.present(successAlertController, animated: true)
        }
        
        // alertController에 "결제" 버튼만 추가
        alertController.addAction(payAction)
        
        // 얼럿 표시
        present(alertController, animated: true)
    }
    
    // 취소 버튼 누르면
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        
        // 얼럿 설정
        let alertController = UIAlertController(title: "내역 삭제", message: "장바구니를 비웁니다.", preferredStyle: .alert)
        
        // "삭제" 버튼 설정
        let deleteAction = UIAlertAction(title: "삭제", style: .default) { _ in
            // Cell에 받은 데이터를 초기화하기
            self.itemArray.removeAll()
            self.bottomTableView.reloadData()
            self.totalPriceUpdate()
            self.checkPaymentAvailability()
            self.configureUI()
        }
        
        // "취소" 버튼 설정
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        // alertController에 "삭제"와 "취소" 버튼을 편성
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
}
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    // 피커뷰의 컴포넌트 수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 피커뷰의 행 수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    // 각 행에 해당하는 타이틀을 반환
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)" // 1부터 10까지의 수량을 문자열로 반환
    }
    
    // 피커뷰에서 선택된 행의 값을 가져와서 주문 수량을 업데이트
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 현재 선택된 셀의 인덱스를 가져옵니다.
        guard let indexPath = bottomTableView.indexPathForSelectedRow else {
            return
        }
        // 선택된 셀에 해당하는 아이템을 가져옵니다.
        var selectedItem = itemArray[indexPath.row]
        // 새로운 주문 수량을 설정합니다.
        let newCount = row + 1
        // 아이템의 주문 수량을 변경하고 테이블 뷰를 업데이트합니다.
        selectedItem.count = newCount
        itemArray[indexPath.row] = selectedItem
        bottomTableView.reloadRows(at: [indexPath], with: .automatic)
        // 총 가격 업데이트
        totalPriceUpdate()
        // 결제 가능 여부 확인
        checkPaymentAvailability()
    }
    func checkPaymentAvailability() {
        print(itemArray)
        if itemArray.isEmpty {
          // itemArray가 비어있으면 결제하기 버튼 비활성화
          cancelButton.isEnabled = false
          payButton.isEnabled = false
          payButton.backgroundColor = UIColor.lightGray
          payButton.setTitleColor(.black, for: .normal)
        } else {
          // itemArray에 내용이 있으면 결제하기 버튼 활성화
          cancelButton.isEnabled = true
          payButton.isEnabled = true
          payButton.backgroundColor = .black
          payButton.setTitleColor(.white, for: .normal)

        }
    }
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testitemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MiddleCell", for: indexPath) as? MiddleCell else {
            fatalError("Unable to dequeue MyCustomCell")
        }
        setupCollectionView()
        
        // testitemArray에서 안전하게 아이템 추출
        guard indexPath.row < testitemArray.count else {
            return cell
        }
        let item = testitemArray[indexPath.row]
        
        // formatCurrency(amount:)의 반환값이 nil이 아닌지 확인
        
        cell.black.text = "₩ " + formatCurrency(amount: item.price)!
        cell.white.text = item.name
        
        // UIImage(named:) 생성자가 nil을 반환하지 않는지 확인
        guard let image = UIImage(named: item.name) else {
            print("Image named \(item.name) not found, setting default image")
            cell.image.image = UIImage(named: "DefaultImage") // 기본 이미지 설정
            return cell
        }
        cell.image.image = image
        
        return cell
        //let item = testitemArray[indexPath.row]
        //cell.black.text = "₩ " + formatCurrency(amount: item.price)!
        //cell.white.text = item.name
        //cell.image.image = UIImage(named: item.name)
        
        //return cell
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8 // Vertical spacing between cells
        layout.minimumInteritemSpacing = 8 // Horizontal spacing between cells
        layout.scrollDirection = .vertical
        let itemWidth = (self.middleCollectionView.frame.width - 8) / 2 // Width of each item
        layout.itemSize = CGSize(width: itemWidth, height: 190)
        self.middleCollectionView.collectionViewLayout = layout
    }

}




