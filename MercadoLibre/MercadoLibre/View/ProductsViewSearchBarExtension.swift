//
//  ProductsViewControllerSearchBarExtension.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 20/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit

// MARK: UISearchBarDelegate
extension ProductsView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            productViewDelegate?.loadProducts(searchText)
        } else {
            print("search something")
        }
    }
}
