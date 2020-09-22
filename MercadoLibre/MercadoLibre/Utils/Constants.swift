//
//  Constants.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 20/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    struct Titles {
        static let products = "Mercado Libre Products"
    }
    
    struct Constraint {
        static let searchBarHeight: CGFloat = 50
    }
    
    struct Endpoint {
        static let productSearch = "https://api.mercadolibre.com/sites/MLA/search?q="
    }
    
    struct ProductsTable {
        static let reuseIdentifier = "productsCell"
        static let placeHolderID = "productCellPlaceHolder"
    }
}
