//
//  ProductDetail.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 24/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import Foundation

struct ProductDetail: Codable {
    //MARK: Properties
    let productDescription: String
    
    enum CodingKeys: String, CodingKey {
        case productDescription = "plain_text"
    }
}
