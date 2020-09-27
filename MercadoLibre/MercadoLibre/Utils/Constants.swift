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
        static let welcome = "Welcome to Mercado Libre"
        static let products = "Mercado Libre Products"
        static let details = "Product details"
    }
    
    struct Constraint {
        static let generalPadding: CGFloat = 50
        static let searchBarHeight: CGFloat = 50
    }
    
    struct Endpoint {
        static let productSearch = "https://api.mercadolibre.com/sites/MLA/search?q="
        static let productDetail = "https://api.mercadolibre.com/items/"
    }
    
    struct ProductsTable {
        static let reuseIdentifier = "productsCell"
        static let placeHolderID = "productCellPlaceHolder"
    }
    
    struct Branding {
        static let primaryColor = UIColor(red: 247/255.0, green: 234/255.0, blue: 31/255.0, alpha: 1)
    }
    
    struct ErrorMessages {
        static let emptySearchText = "Insert some text to search"
        static let emptyProductList = "No results for your search. Try to look up for something else"
        static let internetConnectionFailed = "There was a problem with your internet connection. Please try again later"
    }
}
