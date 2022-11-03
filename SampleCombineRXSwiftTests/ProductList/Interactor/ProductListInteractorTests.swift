//
//  ProductListInteractorTests.swift
//  SampleCombineRXSwift
//
//  Created by Ritu on 2022-11-03.
//


import XCTest
import Combine
@testable import SampleCombineRXSwift

class ProductListInteractorTests: XCTestCase {
    
    var mockWebService: MockWebService!
    var interactor: MockProductListInteractor!
    var cancellable: AnyCancellable!

    override func setUpWithError() throws {
        mockWebService = MockWebService()
        interactor = MockProductListInteractor()
    }

    override func tearDownWithError() throws {
        mockWebService = nil
        interactor = nil
        cancellable = nil
    }
    
    func testProductListInteractor_WhenInitiliazed_CalledGetProducts() {
        _ = interactor.productList()
        XCTAssertTrue(interactor.productListCalled, "This should return true but returning false")
    }
    
    func testProductListInteractor_WhenCalled_ReturnProducts() {
        let publisher = interactor.productList()
        _ = publisher.sink { product in
            print(product?.count)
        }
        
        XCTAssertNotNil(publisher)
    }

}
