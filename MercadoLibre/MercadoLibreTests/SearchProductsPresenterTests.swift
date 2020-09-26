//
//  SearchProductsPresenterTests.swift
//  MercadoLibreTests
//
//  Created by Gaston Daniel Gabriel Grippi on 20/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import XCTest
@testable import MercadoLibre

class SearchProductsPresenterTests: XCTestCase {

    func testSearchTextCallsCount() throws {
        // Given
        let searchPresenter = SearchProductsPresenter()
        let searchProductsViewMock = SearchProductsViewMock()
        searchPresenter.view = searchProductsViewMock
        
        // When
        searchPresenter.sendSearchText("test")
        
        // Then
        XCTAssertEqual(searchProductsViewMock.navigateToProductViewWithDataCount, 1)
    }
    
    func testSearchTextSent() throws {
        // Given
        let searchPresenter = SearchProductsPresenter()
        let searchProductsViewMock = SearchProductsViewMock()
        searchPresenter.view = searchProductsViewMock
        
        // When
        searchPresenter.sendSearchText("test")
        
        // Then
        XCTAssertEqual(searchProductsViewMock.searchText, "test")
    }
    
    func testSearchEmptyText() throws {
        // Given
        let searchPresenter = SearchProductsPresenter()
        let searchProductsViewMock = SearchProductsViewMock()
        searchPresenter.view = searchProductsViewMock
        
        // When
        searchPresenter.sendSearchText(nil)
        
        // Then
        XCTAssertEqual(searchProductsViewMock.showErrorEmptySearchTextCount, 1)
    }
    
    func testSearchNotEmptyText() throws {
        // Given
        let searchPresenter = SearchProductsPresenter()
        let searchProductsViewMock = SearchProductsViewMock()
        searchPresenter.view = searchProductsViewMock
        
        // When
        searchPresenter.sendSearchText("test")
        
        // Then
        XCTAssertEqual(searchProductsViewMock.showErrorEmptySearchTextCount, 0)
    }
}


class SearchProductsViewMock :SearchProductsViewDelegateProtocol {
    var navigateToProductViewWithDataCount = 0
    var searchText: String?
    var showErrorEmptySearchTextCount = 0
    
    func navigateToProductViewWithData(_ data: SearchDTO) {
        navigateToProductViewWithDataCount += 1
        searchText = data.searchText
    }
    
    func showErrorEmptySearchText() {
        showErrorEmptySearchTextCount += 1
    }
}
