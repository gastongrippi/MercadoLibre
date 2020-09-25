//
//  ProductsDelegateProtocol.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 20/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import Foundation

protocol ProductsDelegateProtocol {
    var view: ProductsViewDelegateProtocol? { get set }
    func loadProducts(_ products: String)
    func getProductsCount() -> Int
    func getProductName(index: IndexPath) -> String
    func getProductImageURL(index: IndexPath) -> URL
    func getProductCondition(index: IndexPath) -> String
    func getProductId(index: IndexPath) -> String
    func getProductPrice(index: IndexPath) -> Double
}
