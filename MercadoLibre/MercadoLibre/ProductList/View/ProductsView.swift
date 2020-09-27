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
    private var loadingIndicator = UIActivityIndicatorView()
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
        customizeloadingIndicator()
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
    
    private func customizeloadingIndicator() {
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.style = .large
        loadingIndicator.backgroundColor = .white
        loadingIndicator.hidesWhenStopped = true
    }
    
    private func setViewsConstraints() {
        view.addSubview(productsTableView)
        NSLayoutConstraint.activate([
            productsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: getNavigationBarHeight()),
            productsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        view.addSubview(loadingIndicator)
        NSLayoutConstraint.activate([
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.heightAnchor.constraint(equalToConstant: 100),
            loadingIndicator.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func loadProducts() {
        if let searchText = searchData?.searchText {
            startLoadingIndicator()
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

//MARK: ProductsViewDelegateProtocol
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
    
    func startLoadingIndicator() {
        DispatchQueue.main.async { [unowned self] in
            self.loadingIndicator.startAnimating()
        }
    }
    
    func stopLoadingIndicator() {
        DispatchQueue.main.async { [unowned self] in
            self.loadingIndicator.stopAnimating()
        }
    }
}
