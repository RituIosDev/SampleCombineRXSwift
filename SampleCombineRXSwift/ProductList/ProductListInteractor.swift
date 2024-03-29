//
//  ProductListInteractor.swift
//  SampleCombineRXSwift
//
//  Created by Ritu on 2022-11-03.
//

import Foundation
import Combine

///  Responsible for receiving an input, perform an operation using that input and comunicating the output of that operation.
protocol ProductListInteractorProtocol{
    func productList() -> AnyPublisher<[Product]?, Never>
}

/// Responsible to obtain the productlist form webservice and return the values to presenter.
class ProductListInteractor:ProductListInteractorProtocol{

    private let productWebService: ProductWebserviceProtocol
    
    init(webService: ProductWebserviceProtocol){
        self.productWebService = webService
    }

    /// Called by  presenter to retreive the list of products
    /// Returns the produts-array/Error to presenter
    func productList() -> AnyPublisher<[Product]?, Never> {
        productWebService.getListOfProducts(fromUrl: EndpointProvider.productListendPoint())
            .receive(on: RunLoop.main, options: nil)
            .eraseToAnyPublisher()
    }
    
}
