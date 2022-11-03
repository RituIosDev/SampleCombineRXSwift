//
//  ProductsListModel.swift
//  SampleCombineRXSwift
//
//  Created by Ritu on 2022-11-03.
//
import Foundation

// Holds response of response json with list of products
struct ProductsList: Codable {
    let products: [Product]
}
