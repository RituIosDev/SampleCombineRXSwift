//
//  MockCartListPresenter.swift
//  SampleCombineRXSwift
//
//  Created by Ritu on 2022-11-03.
//


import Foundation
import Combine
@testable import SampleCombineRXSwift

class MockCartListPresenter: CartListPresenterProtocol {
    var cartListPublisher: AnyPublisher<Void, Never> = Result.Publisher(()).eraseToAnyPublisher()
    var products: [Product] = []
    var initiateProductListCalled: Bool  = false
    var cancellables : AnyCancellable?
    private var updateCartListPublisher = PassthroughSubject<Void, Never>()
    private var taxes = 13
    
    func getCartProducts() -> [Product] {
        return products
    }
    
    func initiateCartProductList() {
        initiateProductListCalled = true
        cancellables = cartListPublisher.sink(receiveValue: { _ in
            print("cartListPublisher Value Received")
        })
    }
    
    func updateProductList() {
        initiateCartProductList()
        products = getCartProducts()
        updateCartListPublisher.send()
    }
    
    func productsCount() -> Int {
        return products.count
    }
    
    func getCurrentProduct(at index: Int) -> Product {
        return products[index]
    }
    
    func getSubTotal() -> Int {
        var price = 0
        for item in getCartProducts(){
            price = price + item.price
        }
        return price
     
    }
    
    func getTaxes() -> Double {
        return ((Double(getSubTotal()) * Double(taxes))/100)
    }
    
    func getTotal() -> Double {
        return Double(getSubTotal()) + getTaxes()
    }
    
}
