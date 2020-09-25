//
//  ProductDetailPresenter.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 24/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import Foundation

class ProductDetailPresenter: ProductDetailDelegateProtocol {    
    
    //MARK: Properties
    private var productDetail: ProductDetail?
    private let service: ProductServiceProtocol?
    var view: ProductDetailViewDelegateProtocol?
    
    //MARK: Initializer
    init(service: ProductServiceProtocol) {
        self.service = service
    }
    
    //MARK: ProductDetailProtocol
    func loadProductDetailWithId(_ id: String) {
        service?.getProductDetailWithId(id, successBlock: { [weakSelf=self] (response) in
            weakSelf.productDetail = response
            weakSelf.view?.reloadProductDescription()
        }, errorBlock: { error in
            print(error)
        })
    }
    
    func getProductDescription() -> String {
        return productDetail?.productDescription ?? "No description found"
    }
}
