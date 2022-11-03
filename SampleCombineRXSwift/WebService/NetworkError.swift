//
//  Error.swift
//  SampleCombineRXSwift
//
//  Created by Ritu on 2022-11-03.
//

import Foundation

enum NetworkError : LocalizedError, Equatable, Error {
    
    case responseModelParsingError
    case invalidRequestURLStringError
    
    
    var errorDescription: String? {
        switch self {
        case .invalidRequestURLStringError, .responseModelParsingError:
            return ""
        }
    }
}
