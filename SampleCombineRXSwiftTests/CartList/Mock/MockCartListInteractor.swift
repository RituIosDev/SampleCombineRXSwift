//
//  MockCartListInteractor.swift
//  SampleCombineRXSwift
//
//  Created by Ritu on 2022-11-03.
//


import Foundation
import Combine
@testable import SampleCombineRXSwift

class MockCartListInteractor: CartListInteractorProtocol{
    
    var productListCalled: Bool = false
    var listOfProducts: [Product]?
    
    
    func productList() -> AnyPublisher<[Product], Never> {
        productListCalled = true
        let product = Product.defaultProduct
        
        listOfProducts = [product]
        return Just(listOfProducts!).eraseToAnyPublisher()
    }
}
