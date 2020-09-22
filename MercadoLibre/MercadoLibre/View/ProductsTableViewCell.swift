//
//  ProductsViewCell.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 22/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
    //MARK: Properties
    var productName = UILabel(frame: .zero)
    var productImage = UIImageView(frame: .zero)
    var productCondition = UILabel(frame: .zero)
    
    //MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customizeProductNameView()
        customizeProductImageView()
        customizeProductConditionView()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: private methods
    
    private func customizeProductNameView() {
        productName.translatesAutoresizingMaskIntoConstraints = false
        productName.numberOfLines = 0
    }
    
    private func customizeProductImageView() {
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.contentMode = .scaleAspectFit
    }
    
    private func customizeProductConditionView() {
        productCondition.translatesAutoresizingMaskIntoConstraints = false
        productCondition.numberOfLines = 0
    }
    
    private func addConstraints() {
        contentView.addSubview(productName)
        contentView.addSubview(productCondition)
        contentView.addSubview(productImage)
        
        NSLayoutConstraint.activate([
            productName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            productName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 5),
            productName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            productCondition.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 10),
            productCondition.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 5),
            productCondition.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productCondition.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            productImage.heightAnchor.constraint(equalToConstant: 100),
            productImage.widthAnchor.constraint(equalToConstant: 100),
            productImage.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -15)
        ])
    }
}
