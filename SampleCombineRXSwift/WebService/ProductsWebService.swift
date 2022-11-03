//
//  ProductsWebService.swift
//  SampleCombineRXSwift
//
//  Created by Ritu on 2022-11-03.
//

import Foundation
import Combine

protocol ProductWebserviceProtocol{
    func getListOfProducts(fromUrl: URL)->AnyPublisher<[Product]?, Never>
}

class ProductsWebService:ProductWebserviceProtocol{
    
    private let networkClient:NetworkClientProtocol
    
    init(networkClient:NetworkClientProtocol = NetworkClient()){
        self.networkClient = networkClient
    }
    
    
    /// Downloads and returns the array of products from endpoint or returns error message
    func getListOfProducts(fromUrl: URL) -> AnyPublisher<[Product]?, Never> {
        
        return networkClient.getResponseData(fromUrl: fromUrl, type: ProductsList.self)
            .map{$0?.products}
            .receive(on: RunLoop.main, options: nil)
            .eraseToAnyPublisher()   
    }

}
