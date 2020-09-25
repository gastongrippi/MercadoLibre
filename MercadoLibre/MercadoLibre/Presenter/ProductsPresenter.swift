//
//  ProductsPresenter.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 20/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//
import Foundation

class ProductsPresenter: ProductsDelegateProtocol {
    
    //MARK: Properties
    lazy private var products = [Product]()
    private let service: ProductServiceProtocol?
    var view: ProductsViewDelegateProtocol?
    
    //MARK: Initializer
    init(service: ProductServiceProtocol) {
        self.service = service
    }
    
    //MARK: ProductsPresenterDelegateProtocol
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
    
    func getProductId(index: IndexPath) -> String {
        return products[index.row].id
    }
    
    func getProductPrice(index: IndexPath) -> Double {
        return products[index.row].price
    }
    
}
