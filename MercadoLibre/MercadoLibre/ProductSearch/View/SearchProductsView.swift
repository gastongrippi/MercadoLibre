//
//  searchProductsView.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 22/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit

class SearchProductsView: UIViewController {
    //MARK: Properties
    weak var coordinator: MainCoordinator?
    private var mercadoLibreLogo = UIImageView(frame: .zero)
    private var productsSearchBar = UISearchBar(frame: .zero)
    var searchProductsViewDelegate: SearchProductsDelegateProtocol?

    // MARK: Initializer
    init(delegate: SearchProductsDelegateProtocol) {
        super.init(nibName: nil, bundle: nil)
        searchProductsViewDelegate = delegate
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeView()
        customizeMercadoLibreLogo()
        customizeProductSearchBar()
        setDelegates()
        setViewsConstraints()
    }

    //MARK: private methods
    private func customizeView() {
        title = Constants.Titles.welcome
        view.backgroundColor = Constants.Branding.primaryColor
    }
    
    private func customizeMercadoLibreLogo() {
        mercadoLibreLogo.translatesAutoresizingMaskIntoConstraints = false
        mercadoLibreLogo.image = UIImage(named: "welcomeMercadoLibre")
    }
    
    private func customizeProductSearchBar() {
        productsSearchBar.translatesAutoresizingMaskIntoConstraints = false
        productsSearchBar.searchTextField.layer.cornerRadius = 20
        productsSearchBar.searchTextField.layer.masksToBounds = true
        productsSearchBar.placeholder = "What are you looking for?"
    }
    
    private func setDelegates() {
        productsSearchBar.delegate = self
    }

    private func setViewsConstraints() {
        view.addSubview(mercadoLibreLogo)
        NSLayoutConstraint.activate([
            mercadoLibreLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mercadoLibreLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: getNavigationBarHeight() + Constants.Constraint.generalPadding),
            mercadoLibreLogo.heightAnchor.constraint(equalToConstant: 150),
            mercadoLibreLogo.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        view.addSubview(productsSearchBar)
        NSLayoutConstraint.activate([
            productsSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Constraint.generalPadding),
            productsSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Constraint.generalPadding),
            productsSearchBar.topAnchor.constraint(equalTo: mercadoLibreLogo.bottomAnchor, constant: Constants.Constraint.generalPadding),
            productsSearchBar.heightAnchor.constraint(equalToConstant: Constants.Constraint.searchBarHeight)
        ])
    }
}

//MARK: UISearchBarDelegate
extension SearchProductsView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchProductsViewDelegate?.sendSearchText(searchBar.text)
    }
}

//MARK: SearchProductsViewDelegateProtocol
extension SearchProductsView: SearchProductsViewDelegateProtocol {
    func navigateToProductViewWithData(_ data: SearchDTO) {
        coordinator?.showProductsViewWithData(data)
    }
    
    func showErrorEmptySearchText() {
        showErrorWithMessage(Constants.ErrorMessages.emptySearchText)
    }
}
