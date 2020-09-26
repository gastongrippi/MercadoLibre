//
//  ProductDetailServiceProtocol.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 26/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import Foundation

protocol ProductDetailServiceProtocol {
    func getProductDetailWithId(_ id: String, successBlock: @escaping (ProductDetail) -> (), errorBlock: @escaping (Error) -> ())
}
