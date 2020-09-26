//
//  ProductDTO.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 24/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

struct ProductDTO {
    var id: String?
    var price: Double?
    
    init(id: String?, price: Double?) {
        self.id = id
        self.price = price
    }
}
