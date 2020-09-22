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
    var productsTableView = UITableView(frame: .zero)
    var productViewDelegate: ProductsPresenterDelegateProtocol?
    var searchData: SearchDTO?
    
    // MARK: Initializer
    init(delegate: ProductsPresenterDelegateProtocol, searchData: SearchDTO) {
        super.init(nibName: nil, bundle: nil)
        productViewDelegate = delegate
        self.searchData = searchData
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
        productViewDelegate?.loadProducts(searchData?.searchText ?? "")
    }
    
    //MARK: private methods
    private func setDelegates() {
        productsTableView.delegate = self
        productsTableView.dataSource = self
    }
    
    private func customizeProductTableView() {
        productsTableView.translatesAutoresizingMaskIntoConstraints = false
        productsTableView.rowHeight = UITableView.automaticDimension
        productsTableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: Constants.ProductsTable.reuseIdentifier)
    }
    
    private func setViewsConstraints() {
        view.addSubview(productsTableView)
        productsTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: getNavigationBarHeight()),
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
