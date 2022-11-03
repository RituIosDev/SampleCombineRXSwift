//
//  NetworkClientMock.swift
//  SampleCombineRXSwift
//
//  Created by Ritu on 2022-11-03.
//


import Foundation
import Combine
@testable import SampleCombineRXSwift

class NetworkClientMock:NetworkClientProtocol{
    
    var dataResult: Decodable?
    
    func getResponseData<T: Decodable>(fromUrl: URL, type:T.Type) -> AnyPublisher<T?,Never> {

        return Just(dataResult as? T)
            .eraseToAnyPublisher()
    }
}
