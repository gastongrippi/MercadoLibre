//
//  ProductServiceProtocol.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 20/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

protocol ProductServiceProtocol {
    func getProductsWithName(_ name:String, successBlock: @escaping (ProductResponse) -> (), errorBlock: @escaping (Error) -> ())
}
