//
//  ProductsPresenter.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 20/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//
import Foundation

class ProductsPresenter: ProductsPresenterDelegateProtocol {
    
    //MARK: Properties
    lazy private var products = [Product]()
    private let service: ProductServiceProtocol?
    weak var view: ProductsViewDelegateProtocol?
    
    //MARK: Initializer
    init(service: ProductServiceProtocol) {
        self.service = service
    }
    
    //MARK: ProductsPresenterDelegateProtocold
    func loadProducts(_ products: String) {
        service?.getProductsWithName(products, successBlock: { [weakSelf=self] response in
            for product in response.results {
                weakSelf.products.append(product)
            }
            weakSelf.view?.reloadProductsTable()
        }, errorBlock: { error in
            print(error)
        })
    }
    
    func getProductsCount() -> Int {
        return products.count
    }
    
    func getProductName(index: IndexPath) -> String {
        return products[index.row].name
    }
    
    func getProductImageURL(index: IndexPath) -> URL {
        return URL(string: products[index.row].imageURL)!
    }
    
    func getProductCondition(index: IndexPath) -> String {
        return "Condition: \(products[index.row].condition)"
    }
    
    
}
