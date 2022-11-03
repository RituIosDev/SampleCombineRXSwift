//
//  Endpoint.swift
//  SampleCombineRXSwift
//
//  Created by Ritu on 2022-11-03.
//

import Foundation

class EndpointProvider {
    /// Provides endpoint url for productList
    static func productListendPoint() -> URL{
        
        guard let url = URL(string: "https://dummyjson.com/products") else {
            fatalError("Invalid Url")
        }
        
        return url
    }
}
