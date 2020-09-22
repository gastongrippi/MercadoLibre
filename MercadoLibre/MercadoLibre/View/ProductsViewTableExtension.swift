//
//  ProductsViewControllerTableViewExtension.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 20/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit
import SDWebImage

//MARK: UITableViewDataSource
extension ProductsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productViewDelegate?.getProductsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ProductsTable.reuseIdentifier) as! ProductsTableViewCell
        cell.productName.text = productViewDelegate?.getProductName(index: indexPath)
        cell.productCondition.text = productViewDelegate?.getProductCondition(index: indexPath)        
        cell.productImage.sd_setImage(with: productViewDelegate?.getProductImageURL(index: indexPath), placeholderImage: UIImage(named: Constants.ProductsTable.placeHolderID),completed: nil)
        
        return cell
    }
    
}

//MARK: UITableViewDelegate
extension ProductsView: UITableViewDelegate {
    
}
