//
//  MercadoLibreTests.swift
//  MercadoLibreTests
//
//  Created by Gaston Daniel Gabriel Grippi on 20/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import XCTest
@testable import MercadoLibre

class SearchBarPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchTextExample() throws {
        let searchPresenter = SearchProductsPresenter()
        let searchProductsViewMock = SearchProductsViewControllerMock()
        searchPresenter.view = searchProductsViewMock
        searchPresenter.sendSearchText("test")
        XCTAssertEqual(searchProductsViewMock.navigateToProductViewWithDataCount, 1)
        XCTAssertEqual(searchProductsViewMock.searchText, "test")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}


class SearchProductsViewControllerMock :SearchProductsViewDelegateProtocol {
    var navigateToProductViewWithDataCount = 0
    var searchText: String?
    
    func navigateToProductViewWithData(_ data: SearchDTO) {
        navigateToProductViewWithDataCount = 1
        searchText = data.searchText
    }
    
}
