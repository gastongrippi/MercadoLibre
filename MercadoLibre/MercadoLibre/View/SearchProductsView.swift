//
//  searchProductsView.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 22/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit

class SearchProductsView: UIViewController {
    weak var coordinator: MainCoordinator?
    var mercadoLibreLogo = UIImageView(frame: .zero)
    var productsSearchBar = UISearchBar(frame: .zero)
    var searchProductsViewDelegate: SearchProductsPresenterDelegateProtocol?

    // MARK: Initializer
    init(delegate: SearchProductsPresenterDelegateProtocol) {
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
        customizeImage()
        customizeSearchBar()
        setDelegates()
        setViewsConstraints()
    }

    //MARK: private methods
    private func customizeView() {
        title = Constants.Titles.welcome
        view.backgroundColor = Constants.Branding.primaryColor
    }
    
    private func customizeImage() {
        mercadoLibreLogo.translatesAutoresizingMaskIntoConstraints = false
        mercadoLibreLogo.image = UIImage(named: "welcomeMercadoLibre")
    }
    
    private func customizeSearchBar() {
        productsSearchBar.translatesAutoresizingMaskIntoConstraints = false
        productsSearchBar.inputView?.backgroundColor = .red
        productsSearchBar.searchTextField.layer.cornerRadius = 20
        productsSearchBar.searchTextField.layer.masksToBounds = true
    }
    
    private func setDelegates() {
        productsSearchBar.delegate = self
    }

    private func setViewsConstraints() {
        view.addSubview(mercadoLibreLogo)
        NSLayoutConstraint.activate([
            mercadoLibreLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mercadoLibreLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: getNavigationBarHeight()+50),
            mercadoLibreLogo.heightAnchor.constraint(equalToConstant: 150),
            mercadoLibreLogo.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        view.addSubview(productsSearchBar)
        NSLayoutConstraint.activate([
            productsSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            productsSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            productsSearchBar.topAnchor.constraint(equalTo: mercadoLibreLogo.bottomAnchor, constant: 50),
            productsSearchBar.heightAnchor.constraint(equalToConstant: Constants.Constraint.searchBarHeight)
        ])
    }
}


extension SearchProductsView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            searchProductsViewDelegate?.sendSearchText(searchText)
        }
    }
}
