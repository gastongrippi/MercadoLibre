//
//  ViewController.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 20/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit

class ProductsView: UIViewController {
    
    // MARK: Properties
    weak var coordinator: MainCoordinator?
    var productsSearchBar = UISearchBar(frame: .zero)
    var productsTableView = UITableView(frame: .zero)
    var productViewDelegate: ProductsPresenterDelegateProtocol?
    
    // MARK: Initializer
    init(delegate: ProductsPresenterDelegateProtocol) {
        super.init(nibName: nil, bundle: nil)
        productViewDelegate = delegate
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.Titles.products
        setDelegates()
        customizeProductTableView()
        setViewsConstraints()
    }
    
    //MARK: private methods
    private func setDelegates() {
        productsSearchBar.delegate = self
        productsTableView.delegate = self
        productsTableView.dataSource = self
    }
    
    private func customizeProductTableView() {
        productsTableView.translatesAutoresizingMaskIntoConstraints = false
        productsTableView.rowHeight = UITableView.automaticDimension
        productsTableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: Constants.ProductsTable.reuseIdentifier)
    }
    
    private func setViewsConstraints() {
        view.addSubview(productsSearchBar)
        productsSearchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productsSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productsSearchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: getNavigationBarHeight()),
            productsSearchBar.heightAnchor.constraint(equalToConstant: Constants.Constraint.searchBarHeight)
        ])
        
        view.addSubview(productsTableView)
        productsTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productsTableView.topAnchor.constraint(equalTo: productsSearchBar.bottomAnchor),
            productsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}


extension ProductsView: ProductsViewDelegateProtocol {
    func reloadProductsTable() {
        DispatchQueue.main.async {
            self.productsTableView.reloadData()
        }
    }
}
