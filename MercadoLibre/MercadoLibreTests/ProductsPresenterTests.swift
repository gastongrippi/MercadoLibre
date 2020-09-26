//
//  ProductsPresenterTests.swift
//  MercadoLibreTests
//
//  Created by Gaston Daniel Gabriel Grippi on 25/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import Foundation

import XCTest
@testable import MercadoLibre

class ProductsPresenterTests: XCTestCase {
    var someProducts = [Product]()
    var emptyProducts = [Product]()
    
    
    override func setUp() {
        someProducts = [
            Product(name: "product 1", id: "Id 1", price: 100, imageURL: "someImageUrl1", condition: "new"),
            Product(name: "product 2", id: "Id 2", price: 200, imageURL: "someImageUrl2", condition: "new2"),
            Product(name: "product 3", id: "Id 3", price: 300, imageURL: "someImageUrl3", condition: "used"),
            Product(name: "product 4", id: "Id 4", price: 400, imageURL: "someImageUrl4", condition: "used2"),
        ]
    }
    
    func testGetProductsWithNameCallsCount() throws {
        // Given
        let productsSuccessServiceMock = ProductsServiceAlwaysSuccessMock()
        let productsViewMock = ProductsViewDelegateMock()
        let productsPresenter = ProductsPresenter(service: productsSuccessServiceMock)
        productsPresenter.view = productsViewMock
        let productResponse = ProductResponse(results: someProducts)
        
        productsSuccessServiceMock.resultProduct = productResponse
        productsPresenter.view = productsViewMock
        
        // When
        productsPresenter.loadProducts("Product name")
        
        // Then
        XCTAssertEqual(productsSuccessServiceMock.getProductsWithNameCount, 1)
    }
    
    func testReloadProductsTableWithSomeProducts() throws {
        // Given
        let productsSuccessServiceMock = ProductsServiceAlwaysSuccessMock()
        let productsViewMock = ProductsViewDelegateMock()
        let productsPresenter = ProductsPresenter(service: productsSuccessServiceMock)
        let productResponse = ProductResponse(results: someProducts)

        productsSuccessServiceMock.resultProduct = productResponse
        productsPresenter.view = productsViewMock
        
        // When
        productsPresenter.loadProducts("Product name")
        
        // Then
        XCTAssertEqual(productsViewMock.reloadProductsTableCount, 1)
    }
    
    func testReloadProductsTableWithEmptyProducts() throws {
        // Given
        let productsSuccessServiceMock = ProductsServiceAlwaysSuccessMock()
        let productsViewMock = ProductsViewDelegateMock()
        let productsPresenter = ProductsPresenter(service: productsSuccessServiceMock)
        let productResponse = ProductResponse(results: emptyProducts)

        productsSuccessServiceMock.resultProduct = productResponse
        productsPresenter.view = productsViewMock
        
        // When
        productsPresenter.loadProducts("Product name")
        
        // Then
        XCTAssertEqual(productsViewMock.reloadProductsTableCount, 0)
    }
    
    func testShowEmptyProductsErrorWithSomeProducts() throws {
        // Given
        let productsSuccessServiceMock = ProductsServiceAlwaysSuccessMock()
        let productsViewMock = ProductsViewDelegateMock()
        let productsPresenter = ProductsPresenter(service: productsSuccessServiceMock)
        let productResponse = ProductResponse(results: someProducts)

        productsSuccessServiceMock.resultProduct = productResponse
        productsPresenter.view = productsViewMock
        
        // When
        productsPresenter.loadProducts("Product name")
        
        // Then
        XCTAssertEqual(productsViewMock.showEmptyProductsErrorCount, 0)
    }
    
    func testShowEmptyProductsErrorWithEmptyProducts() throws {
        // Given
        let productsSuccessServiceMock = ProductsServiceAlwaysSuccessMock()
        let productsViewMock = ProductsViewDelegateMock()
        let productsPresenter = ProductsPresenter(service: productsSuccessServiceMock)
        let productResponse = ProductResponse(results: emptyProducts)

        productsSuccessServiceMock.resultProduct = productResponse
        productsPresenter.view = productsViewMock
        
        // When
        productsPresenter.loadProducts("Product name")
        
        // Then
        XCTAssertEqual(productsViewMock.showEmptyProductsErrorCount, 1)
    }
    
    func testGetProductsWithNameFail() throws {
        // Given
        let productsSuccessServiceMock = ProductsServiceAlwaysFailMock()
        let productsViewMock = ProductsViewDelegateMock()
        let productsPresenter = ProductsPresenter(service: productsSuccessServiceMock)
        let error = NSError(domain:"", code:1100, userInfo:nil)

        productsSuccessServiceMock.error = error
        productsPresenter.view = productsViewMock
        
        // When
        productsPresenter.loadProducts("Product name")
        
        // Then
        XCTAssertEqual(productsViewMock.showErrorConnectionProblemCount, 1)
    }
}


class ProductsServiceAlwaysSuccessMock: ProductServiceProtocol {
    var resultProduct: ProductResponse!
    var getProductsWithNameCount = 0
    func getProductsWithName(_ name: String, successBlock: @escaping (ProductResponse) -> (), errorBlock: @escaping (Error) -> ()) {
        getProductsWithNameCount += 1
        successBlock(resultProduct)
    }
}

class ProductsServiceAlwaysFailMock: ProductServiceProtocol {
    var error: Error!
    var getProductsWithNameCount = 0
    func getProductsWithName(_ name: String, successBlock: @escaping (ProductResponse) -> (), errorBlock: @escaping (Error) -> ()) {
        errorBlock(error)
    }
}

class ProductsViewDelegateMock: ProductsViewDelegateProtocol {
    var reloadProductsTableCount = 0
    var showErrorConnectionProblemCount = 0
    var showEmptyProductsErrorCount = 0
    
    func showErrorConnectionProblem() {
        showErrorConnectionProblemCount += 1
    }
    
    func showEmptyProductsError() {
        showEmptyProductsErrorCount += 1
    }
    
    func reloadProductsTable() {
        reloadProductsTableCount += 1
    }
}
