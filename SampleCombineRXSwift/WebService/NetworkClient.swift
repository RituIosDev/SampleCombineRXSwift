//
//  NetworkClient.swift
//  SampleCombineRXSwift
//
//  Created by Ritu on 2022-11-03.
//

import Foundation
import Combine

protocol NetworkClientProtocol {
    func getResponseData<T: Decodable>(fromUrl: URL, type:T.Type) -> AnyPublisher<T?,Never>
}

class NetworkClient: NetworkClientProtocol{
    
    /// Returns the data of type requested by webservice layer if successful
    /// Else returns error message
    func getResponseData<T: Decodable>(fromUrl: URL, type:T.Type) -> AnyPublisher<T?,Never>{
        return URLSession.shared.dataTaskPublisher(for: fromUrl)
            .map{$0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .map{$0}
            .assertNoFailure()
            .receive(on: RunLoop.main, options: nil)
            .eraseToAnyPublisher()
    }
}

