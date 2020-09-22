//
//  Product.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 20/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import Foundation

struct ProductResponse: Codable {
    let results: [Product]
}

struct Product: Codable {
    //MARK: Properties
    let name: String
    let imageURL: String
    let condition: String
    
    enum CodingKeys: String, CodingKey {
        case name = "title"
        case imageURL = "thumbnail"
        case condition
    }
}
