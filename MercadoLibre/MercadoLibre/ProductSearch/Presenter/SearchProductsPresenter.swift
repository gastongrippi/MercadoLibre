//
//  SearchProductsPresenter.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 22/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import Foundation

class SearchProductsPresenter: SearchProductsDelegateProtocol {
    weak var view: SearchProductsViewDelegateProtocol?
    
    func sendSearchText(_ searchText: String?) {

        guard let searchText = searchText else {
            view?.showErrorEmptySearchText()
            return
        }

        let searchData = SearchDTO(searchText: searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
        view?.navigateToProductViewWithData(searchData)
    }
}
