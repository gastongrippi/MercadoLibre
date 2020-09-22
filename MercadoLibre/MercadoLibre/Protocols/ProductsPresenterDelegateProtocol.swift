
//
//  ProductsPresenterDelegateProtocol.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 20/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import Foundation

protocol ProductsPresenterDelegateProtocol {
    var view: ProductsViewDelegateProtocol? { get set }
    func loadProducts(_ products: String)
    func getProductsCount() -> Int
    func getProductName(index: IndexPath) -> String
    func getProductImage(index: IndexPath) -> String
    func getProductCondition(index: IndexPath) -> String
}
