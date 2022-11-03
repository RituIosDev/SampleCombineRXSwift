//
//  MockWebService.swift
//  SampleCombineRXSwift
//
//  Created by Ritu on 2022-11-03.
//


import Foundation
import Combine
@testable import SampleCombineRXSwift

class MockWebService: ProductWebserviceProtocol {
    
    var getListOfProductsCalled: Bool = false
    var listOfProducts: [Product]?
    
    func getListOfProducts(fromUrl: URL) -> AnyPublisher<[Product]?, Never> {
        getListOfProductsCalled = true
        return Just(listOfProducts).eraseToAnyPublisher()
    }
}
