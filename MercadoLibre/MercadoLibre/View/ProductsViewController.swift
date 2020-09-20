//
//  ViewController.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 20/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    
    // MARK: Properties
    weak var coordinator: MainCoordinator?
    lazy var productsSearchBar = UISearchBar(frame: .zero)
    lazy var productsTableView = UITableView(frame: .zero)
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mercado Libre Products"
        setDelegates()
        setViewsConstraints()
    }
    
    //MARK: private methods
    private func setDelegates() {
        productsSearchBar.delegate = self
        productsTableView.delegate = self
        productsTableView.dataSource = self
    }
    
    private func setViewsConstraints() {
        view.addSubview(productsSearchBar)
        productsSearchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productsSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productsSearchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: getNavigationBarHeight()),
            productsSearchBar.heightAnchor.constraint(equalToConstant: 50)
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
