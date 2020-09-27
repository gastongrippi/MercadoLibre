//
//  ProductDetailView.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 24/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit

class ProductDetailView: UIViewController {
    // MARK: Properties
    weak var coordinator: MainCoordinator?
    private var productPrice = UILabel()
    private var productDescription = UITextView()
    var productDetailViewDelegate: ProductDetailDelegateProtocol?
    private var productData: ProductDTO?
    
    // MARK: Initializer
    init(delegate: ProductDetailDelegateProtocol, productData: ProductDTO) {
        super.init(nibName: nil, bundle: nil)
        productDetailViewDelegate = delegate
        self.productData = productData
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.Titles.details
        customizeView()
        customizeProductPrice()
        customizeProductDescription()
        setViewsConstraints()
        loadProductDetails()
    }
    
    // MARK: Private methods
    private func customizeView() {
        view.backgroundColor = .white
    }
    
    private func customizeProductPrice() {
        productPrice.translatesAutoresizingMaskIntoConstraints = false
        if let price = productData?.price {
            productPrice.text = "Product Price: $\(price)"
        } else {
            productPrice.text = "No Prize founded"
        }
        productPrice.numberOfLines = 1
        productPrice.backgroundColor = .white
        productPrice.textColor = .red
    }

    private func customizeProductDescription() {
        productDescription.translatesAutoresizingMaskIntoConstraints = false
        productDescription.font = .systemFont(ofSize: 20)
        productDescription.isEditable = false
    }
    
    private func setViewsConstraints() {
        view.addSubview(productPrice)
        NSLayoutConstraint.activate([
            productPrice.topAnchor.constraint(equalTo: view.topAnchor, constant: getNavigationBarHeight()),
            productPrice.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productPrice.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        view.addSubview(productDescription)
        NSLayoutConstraint.activate([
            productDescription.leftAnchor.constraint(equalTo: view.leftAnchor),
            productDescription.rightAnchor.constraint(equalTo: view.rightAnchor),
            productDescription.topAnchor.constraint(equalTo: productPrice.bottomAnchor, constant: 20),
            productDescription.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor)
        ])
    }
    
    private func loadProductDetails() {
        if let id = productData?.id {
            productDetailViewDelegate?.loadProductDetailWithId(id)
        } else {
            print("Can not look up for product details with an empty ID")
        }
    }
}

//MARK: ProductDetailViewDelegateProtocol
extension ProductDetailView: ProductDetailViewDelegateProtocol {
    func reloadProductDescription() {
        DispatchQueue.main.async {
            self.productDescription.text = self.productDetailViewDelegate?.getProductDescription()
        }
    }
    
    
}
