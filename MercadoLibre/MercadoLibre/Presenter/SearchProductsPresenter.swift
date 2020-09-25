//
//  SearchProductsPresenter.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 22/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import Foundation

class SearchProductsPresenter: SearchProductsDelegateProtocol {
    weak var view: SearchProductsView?
    
    func sendSearchText(_ searchText: String) {
        let searchData = SearchDTO(searchText: searchText)
        view?.coordinator?.showProductsViewWithData(searchData)
    }
}
