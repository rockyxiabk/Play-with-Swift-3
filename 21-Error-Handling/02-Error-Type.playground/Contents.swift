//: Playground - noun: a place where people can play

import UIKit


// 之前使用可选型表示错误 - 错误时返回空
Int("2")
Int("Hello, Swift")

// 但空不一定是错误
//"Hello, Swift".rangeOfString("Hi")     //swift 2
"Hello, Swift".range(of: "Hi")           //swift 3

// 更符合语意的表示：使用Swift的Error Handling机制
// 比如文件读取; 网络连接 等等等等


class VendingMachine{

    struct Item{
        
        //enum Type: String{         //swift 2
        enum ItemType: String{       //swift 3, 命名问题
            case Water
            case Cola
            case Juice
        }
        
        let type:  ItemType
        let price: Int
        var count: Int
    }
    
    //enum Error: ErrorType{            //swift 2
    enum ItemError: Error{              //swift 3, 命名问题
        case NoSuchItem
        case NotEnoughMoney(Int)
        case OutOfStock
    }
    
    private var items = [ "Mineral Water" : Item(type: .Water, price:2, count:10),
                          "Coca Cola" : Item(type: .Cola, price: 3, count: 5),
                          "Orange Juice" : Item(type: .Juice, price: 5, count: 3)]
    
    
    func vend(itemName itemName: String, money: Int) throws -> Int{
        
        guard let item = items[itemName] else{
            throw VendingMachine.ItemError.NoSuchItem
        }
        
        guard money >= item.price else{
            throw VendingMachine.ItemError.NotEnoughMoney(item.price)
        }
        
        guard item.count > 0 else{
            throw VendingMachine.ItemError.OutOfStock
        }
        
        //dispenseItem(itemName)                //swift 2
        dispenseItem(itemName: itemName)        //swift 3
        
        return money - item.price
    }
    
    private func dispenseItem(itemName: String){
        items[itemName]!.count -= 1
        print("Enjoy your",itemName)
    }
}

