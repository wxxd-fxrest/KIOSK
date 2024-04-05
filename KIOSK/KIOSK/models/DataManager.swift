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
        itemArray = 
        [
        appleItem(name: "MacBook", variety: "Mac", price: 2390000, color: "Midnight", count: 0, rank: 1),
        appleItem(name: "MacBook", variety: "Mac", price: 2390000, color: "Starlight", count: 0, rank: 1),
        appleItem(name: "MacBook", variety: "Mac", price: 2390000, color: "Silver", count: 0, rank: 1),
        appleItem(name: "MacBook", variety: "Mac", price: 2390000, color: "Space Gray", count: 0, rank: 1),
        appleItem(name: "iMac", variety: "Mac", price: 1990000, color: "Midnight", count: 0, rank: 2),
        appleItem(name: "iMac", variety: "Mac", price: 1990000, color: "Starlight", count: 0, rank: 2),
        appleItem(name: "iMac", variety: "Mac", price: 1990000, color: "Silver", count: 0, rank: 2),
        appleItem(name: "iMac", variety: "Mac", price: 1990000, color: "Space Gray", count: 0, rank: 2),
        appleItem(name: "Mac Mini", variety: "Mac", price: 1790000, color: "Midnight", count: 0, rank: 3),
        appleItem(name: "Mac Mini", variety: "Mac", price: 1790000, color: "Starlight", count: 0, rank: 3),
        appleItem(name: "Mac Mini", variety: "Mac", price: 1790000, color: "Silver", count: 0, rank: 3),
        appleItem(name: "Mac Mini", variety: "Mac", price: 1790000, color: "Space Gray", count: 0, rank: 3),
        appleItem(name: "iPhone 15 Pro", variety: "iPhone", price: 1550000, color: "Midnight", count: 0, rank: 1),
        appleItem(name: "iPhone 15 Pro", variety: "iPhone", price: 1550000, color: "Starlight", count: 0, rank: 1),
        appleItem(name: "iPhone 15 Pro", variety: "iPhone", price: 1550000, color: "Silver", count: 0, rank: 1),
        appleItem(name: "iPhone 15 Pro", variety: "iPhone", price: 1550000, color: "Space Gray", count: 0, rank: 1),
        appleItem(name: "iPhone 15 Pro Max", variety: "iPhone", price: 1900000, color: "Midnight", count: 0, rank: 1),
        appleItem(name: "iPhone 15 Pro Max", variety: "iPhone", price: 1900000, color: "Starlight", count: 0, rank: 1),
        appleItem(name: "iPhone 15 Pro Max", variety: "iPhone", price: 1900000, color: "Silver", count: 0, rank: 1),
        appleItem(name: "iPhone 15 Pro Max", variety: "iPhone", price: 1900000, color: "Space Gray", count: 0, rank: 1),
        appleItem(name: "iPhone 15", variety: "iPhone", price: 1250000, color: "Midnight", count: 0, rank: 2),
        appleItem(name: "iPhone 15", variety: "iPhone", price: 1250000, color: "Starlight", count: 0, rank: 2),
        appleItem(name: "iPhone 15", variety: "iPhone", price: 1250000, color: "Silver", count: 0, rank: 2),
        appleItem(name: "iPhone 15", variety: "iPhone", price: 1250000, color: "Space Gray", count: 0, rank: 2),
        appleItem(name: "iPhone 15 Plus", variety: "iPhone", price: 1350000, color: "Midnight", count: 0, rank: 2),
        appleItem(name: "iPhone 15 Plus", variety: "iPhone", price: 1350000, color: "Starlight", count: 0, rank: 2),
        appleItem(name: "iPhone 15 Plus", variety: "iPhone", price: 1350000, color: "Silver", count: 0, rank: 2),
        appleItem(name: "iPhone 15 Plus", variety: "iPhone", price: 1350000, color: "Space Gray", count: 0, rank: 2),
        appleItem(name: "iPhone SE", variety: "iPhone", price: 650000, color: "Midnight", count: 0, rank: 3),
        appleItem(name: "iPhone SE", variety: "iPhone", price: 650000, color: "Starlight", count: 0, rank: 3),
        appleItem(name: "iPhone SE", variety: "iPhone", price: 650000, color: "Silver", count: 0, rank: 3),
        appleItem(name: "iPhone SE", variety: "iPhone", price: 650000, color: "Space Gray", count: 0, rank: 3),
        appleItem(name: "iPad Mini", variety: "iPad", price: 769000, color: "Midnight", count: 0, rank: 2),
        appleItem(name: "iPad Mini", variety: "iPad", price: 769000, color: "Starlight", count: 0, rank: 2),
        appleItem(name: "iPad Mini", variety: "iPad", price: 769000, color: "Silver", count: 0, rank: 2),
        appleItem(name: "iPad Mini", variety: "iPad", price: 769000, color: "Space Gray", count: 0, rank: 2),
        appleItem(name: "iPad Air", variety: "iPad", price: 929000, color: "Midnight", count: 0, rank: 1),
        appleItem(name: "iPad Air", variety: "iPad", price: 929000, color: "Starlight", count: 0, rank: 1),
        appleItem(name: "iPad Air", variety: "iPad", price: 929000, color: "Silver", count: 0, rank: 1),
        appleItem(name: "iPad Air", variety: "iPad", price: 929000, color: "Space Gray", count: 0, rank: 1),
        appleItem(name: "iPad", variety: "iPad", price: 679000, color: "Midnight", count: 0, rank: 2),
        appleItem(name: "iPad", variety: "iPad", price: 679000, color: "Starlight", count: 0, rank: 2),
        appleItem(name: "iPad", variety: "iPad", price: 679000, color: "Silver", count: 0, rank: 2),
        appleItem(name: "iPad", variety: "iPad", price: 679000, color: "Space Gray", count: 0, rank: 2),
        appleItem(name: "iPad Pro", variety: "iPad", price: 1249000, color: "Midnight", count: 0, rank: 3),
        appleItem(name: "iPad Pro", variety: "iPad", price: 1249000, color: "Starlight", count: 0, rank: 3),
        appleItem(name: "iPad Pro", variety: "iPad", price: 1249000, color: "Silver", count: 0, rank: 3),
        appleItem(name: "iPad Pro", variety: "iPad", price: 1249000, color: "Space Gray", count: 0, rank: 3),
        appleItem(name: "Series 9", variety: "Watch", price: 599000, color: "Midnight", count: 0, rank: 1),
        appleItem(name: "Series 9", variety: "Watch", price: 599000, color: "Starlight", count: 0, rank: 1),
        appleItem(name: "Series 9", variety: "Watch", price: 599000, color: "Silver", count: 0, rank: 1),
        appleItem(name: "Series 9", variety: "Watch", price: 599000, color: "Space Gray", count: 0, rank: 1),
        appleItem(name: "Ultra 2", variety: "Watch", price: 1149000, color: "Midnight", count: 0, rank: 2),
        appleItem(name: "Ultra 2", variety: "Watch", price: 1149000, color: "Starlight", count: 0, rank: 2),
        appleItem(name: "Ultra 2", variety: "Watch", price: 1149000, color: "Silver", count: 0, rank: 2),
        appleItem(name: "Ultra 2", variety: "Watch", price: 1149000, color: "Space Gray", count: 0, rank: 2),
        ]
    }
    
    
    
    
    // Mac , iMac , ... Variety로 분류
    func itemsVariety(forVariety variety: String, arr items : [appleItem]) -> [appleItem] {
        return items.filter { $0.variety == variety }
    }
    
    func itemsRank(forVariety rank : Int, arr items : [appleItem]) -> [appleItem] {
        return items.filter { $0.rank == rank }
    }
    func itemsColor(forVariety color : String, arr items : [appleItem]) -> [appleItem] {
        return items.filter { $0.color == color }
    }
    
    func getItemDate() -> [appleItem] {
        return itemArray
    }
    
}
