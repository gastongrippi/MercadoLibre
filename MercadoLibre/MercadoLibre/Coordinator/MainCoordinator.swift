//
//  MainCoordinator.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 20/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit

class MainCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController?

    //MARK: CoordinatorProtocol
    func initialViewController() -> UIViewController {
        navigationController =  UINavigationController(rootViewController: createSearchProductsView())
        return navigationController!
    }

    func showProductsViewWithData(_ data: SearchDTO) {
        let vc = createProductsView(data: data)
        navigationController?.show(vc, sender: self)
    }

    func navigateToProductDetail() {
        
    }

}

extension MainCoordinator {
    func createSearchProductsView() -> UIViewController {
        let presenter = SearchProductsPresenter()
        let viewController = SearchProductsView(delegate: presenter)
        presenter.view = viewController
        viewController.coordinator = self
        
        
        return viewController
    }
    
    func createProductsView(data: SearchDTO) -> UIViewController {
        let service = ProductsService()
        let presenter = ProductsPresenter(service: service)
        let viewController = ProductsView(delegate: presenter, searchData: data)
        viewController.coordinator = self
        presenter.view = viewController
        
        return viewController
    }
}
