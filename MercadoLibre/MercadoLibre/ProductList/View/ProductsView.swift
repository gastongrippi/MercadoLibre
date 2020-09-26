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
    private var productsTableView = UITableView(frame: .zero)
    var productViewDelegate: ProductsDelegateProtocol?
    private var searchData: SearchDTO?
    
    // MARK: Initializer
    init(delegate: ProductsDelegateProtocol, searchData: SearchDTO) {
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
        loadProducts()
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
        NSLayoutConstraint.activate([
            productsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: getNavigationBarHeight()),
            productsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func loadProducts() {
        if let searchText = searchData?.searchText {
            productViewDelegate?.loadProducts(searchText)
        } else {
            self.showErrorEmptySearchText()
        }
    }
    
    private func showErrorEmptySearchText() {
        DispatchQueue.main.async { [unowned self] in
            self.showErrorWithMessage(Constants.ErrorMessages.emptySearchText, completionBlock: { [weakSelf=self] in
                weakSelf.coordinator?.navigationController?.popViewController(animated: true)
            })
        }
    }
}


extension ProductsView: ProductsViewDelegateProtocol {
    func reloadProductsTable() {
        DispatchQueue.main.async { [unowned self] in
            self.productsTableView.reloadData()
        }
    }
    
    func showEmptyProductsError() {
        DispatchQueue.main.async { [unowned self] in
            self.showErrorWithMessage(Constants.ErrorMessages.emptyProductList, completionBlock: { [weakSelf=self] in
                weakSelf.coordinator?.navigationController?.popViewController(animated: true)
            })
        }
    }
    
    func showErrorConnectionProblem() {
        DispatchQueue.main.async { [unowned self] in
            self.showErrorWithMessage(Constants.ErrorMessages.internetConnectionFailed, completionBlock: { [weakSelf=self] in
                weakSelf.coordinator?.navigationController?.popViewController(animated: true)
            })
        }
    }
}
