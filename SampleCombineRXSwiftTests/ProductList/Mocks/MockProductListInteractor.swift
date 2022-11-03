//
//  MockProductListInteractor.swift
//  SampleCombineRXSwift
//
//  Created by Ritu on 2022-11-03.
//


import Foundation
import Combine
@testable import SampleCombineRXSwift

class MockProductListInteractor: ProductListInteractorProtocol {
    
    var productListCalled: Bool = false
    var listOfProducts: [Product]?
    
    func productList() -> AnyPublisher<[Product]?, Never> {
        productListCalled = true
        let product = Product(id: 10, title: "iphone 9", price: 1000, description: "new iphone 9", discountPercentage: 10, rating: 9.5, stock: 10, brand: "Apple", category: "Smart Phone", thumbnail: "ImageUrl")
        
        listOfProducts = [product]
        return Just(listOfProducts).eraseToAnyPublisher()
    }
}
