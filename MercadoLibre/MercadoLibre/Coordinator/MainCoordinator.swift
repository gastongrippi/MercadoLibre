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
        navigationController =  UINavigationController(rootViewController: createProductsView())
        return navigationController!
    }

    func showProductsView() {
        let vc = createProductsView()
        navigationController?.show(vc, sender: self)
    }

    func navigateToProductDetail() {
        
    }

}

extension MainCoordinator {
    func createProductsView() -> UIViewController {
        let service = ProductsService()
        let presenter = ProductsPresenter(service: service)
        let viewController = ProductsView(delegate: presenter)
        viewController.coordinator = self
        presenter.view = viewController
        
        return viewController
    }
}
