//
//  itemsdata.swift
//  KIOSK
//
//  Created by damtea on 4/2/24.
//

import Foundation

class DataManager {
    var itemArray: [appleItem] = []
    var Mac = [
        "MacBook",
        "iMac",
        "Mac Mini"
    ]
    var iPhone = [
        "iPhone 15 Pro",
        "iPhone 15",
        "iPhone SE"
    ]
    var iPad = [
        "iPad Air",
        "iPad",
        "iPad Pro",
    ]
    var watch = [
        "Series 9",
        "Ultra 2"
    ]
    
    
    func makeItemData() {
        var count = 0;
        // MacBook, iMac, Mac Mini
        let macColors = ["Midnight", "Starlight", "Silver", "Space Gray"]
        let macBooks = [
            ("MacBook", 2_390_000),
            ("iMac", 1_990_000),
            ("Mac Mini", 1_790_000)
        ]
        
        // iPhone
        let iphoneColors = ["Starlight", "Silver", "Space Gray", "Midnight"]
        let iphones = [
            ("iPhone 15 Pro", 1_550_000),
            ("iPhone 15", 1_250_000),
            ("iPhone SE", 650_000)
        ]
        
        // iPad
        let ipadColors = ["Starlight", "Silver", "Space Gray", "Midnight"]
        let ipads = [
            ("iPad Air", 929_000),
            ("iPad", 679_000),
            ("iPad Pro", 1_249_000)
        ]
        
        // Watch
        let watchColors = ["Starlight", "Silver", "Space Gray", "Midnight"]
        let watches = [
            ("Series 9", 599_000),
            ("Ultra 2", 1_149_000)
        ]
        
        // Combine all products
        let allProducts = macBooks + iphones + ipads + watches
        let allColors = macColors + iphoneColors + ipadColors + watchColors
        
        // Generate items
        for product in allProducts {
            for color in allColors {
                count += 1
                let newItem = appleItem(name: product.0, variety: "non", price: product.1, color: color, count: 0)
                itemArray.append(newItem)
                if count == 4 {
                    count = 0
                    break;
                }
            }
        }
        
    }
    
    func updateItemVariety() {
            var updatedItems: [appleItem] = []

            for item in itemArray {
                var updatedItem = item // item의 복사본을 만듭니다.
                if ["MacBook", "iMac", "Mac Mini"].contains(item.name) {
                    updatedItem.variety = "Mac"
                } else if ["iPhone 15 Pro", "iPhone 15", "iPhone SE"].contains(item.name) { // item 대신 item.name을 사용합니다.
                    updatedItem.variety = "iPhone"
                } else if ["iPad", "iPad Air", "iPad Mini", "iPad Pro"].contains(item.name) { // item 대신 item.name을 사용합니다.
                    updatedItem.variety = "iPad"
                } else {
                    updatedItem.variety = "Watch"
                }
                updatedItems.append(updatedItem)
            }

            itemArray = updatedItems // 완성된 updatedItems 배열로 itemArray를 업데이트합니다.
    }
    
    // Mac , iMac , ... Variety로 분류
    func itemsVariety(forVariety variety: String) -> [appleItem] {
            return itemArray.filter { $0.variety == variety }
    }
    
    func getItemDate() -> [appleItem] {
        return itemArray
    }
    
}
