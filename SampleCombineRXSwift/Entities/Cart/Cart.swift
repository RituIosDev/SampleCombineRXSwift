//
//  Cart.swift
//  SampleCombineRXSwift
//
//  Created by Ritu on 2022-11-03.
//

import Foundation

class Cart: NSObject, Codable {
    //MARK: - Variables
    var productIds = [Int]()
    
    //MARK: - Custom Methods
    func addProduct(id: Int) {
        guard !productIds.contains(id) else {
            return
        }
        self.productIds.append(id)
        CartsRepository().set(record: self)
    }
    
    func removeProduct(id: Int) {
        self.productIds = self.productIds.filter({$0 != id})
        CartsRepository().set(record: self)
    }
    
}
