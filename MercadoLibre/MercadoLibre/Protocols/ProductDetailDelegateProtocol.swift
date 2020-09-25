//
//  ProductDetailDelegateProtocol.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 24/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

protocol ProductDetailDelegateProtocol {
    var view: ProductDetailViewDelegateProtocol? { get set }
    func loadProductDetailWithId(_ id: String)
    func getProductDescription() -> String
}
