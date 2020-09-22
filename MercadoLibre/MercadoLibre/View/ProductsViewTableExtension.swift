//
//  ProductsViewControllerTableViewExtension.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 20/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit

//MARK: UITableViewDataSource
extension ProductsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productViewDelegate?.getProductsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = productViewDelegate?.getProductName(index: indexPath)
        
        return cell
    }
    
}

//MARK: UITableViewDelegate
extension ProductsView: UITableViewDelegate {
    
}
