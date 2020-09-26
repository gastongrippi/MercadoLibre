//
//  SearchProductsViewDelegateProtocol.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 25/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

protocol SearchProductsViewDelegateProtocol: class {
    func navigateToProductViewWithData(_ data: SearchDTO)
    func showErrorEmptySearchText()
}
