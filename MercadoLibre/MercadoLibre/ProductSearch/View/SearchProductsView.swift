//
//  searchProductsView.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 22/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit

class SearchProductsView: UIViewController {
    //MARK: Properties
    weak var coordinator: MainCoordinator?
    private var mercadoLibreLogo = UIImageView(frame: .zero)
    private var productsSearchBar = UISearchBar(frame: .zero)
    var searchProductsViewDelegate: SearchProductsDelegateProtocol?

    // MARK: Initializer
    init(delegate: SearchProductsDelegateProtocol) {
        super.init(nibName: nil, bundle: nil)
        searchProductsViewDelegate = delegate
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeView()
        customizeMercadoLibreLogo()
        customizeProductSearchBar()
        setDelegates()
        addKeyboardObservers()
        setViewsConstraints()
    }

    //MARK: private methods - Customization
    private func customizeView() {
        title = Constants.Titles.welcome
        view.backgroundColor = Constants.Branding.primaryColor
    }
    
    private func customizeMercadoLibreLogo() {
        mercadoLibreLogo.translatesAutoresizingMaskIntoConstraints = false
        mercadoLibreLogo.image = UIImage(named: "welcomeMercadoLibre")
    }
    
    private func customizeProductSearchBar() {
        productsSearchBar.translatesAutoresizingMaskIntoConstraints = false
        productsSearchBar.searchTextField.layer.cornerRadius = 20
        productsSearchBar.searchTextField.layer.masksToBounds = true
        productsSearchBar.placeholder = "What are you looking for?"
    }
    
    private func setDelegates() {
        productsSearchBar.delegate = self
    }
    
    //MARK: private methods - Constraints
    private func setViewsConstraints() {
        view.addSubview(mercadoLibreLogo)
        NSLayoutConstraint.activate([
            mercadoLibreLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mercadoLibreLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: getNavigationBarHeight() + Constants.Constraint.generalPadding),
            mercadoLibreLogo.heightAnchor.constraint(equalToConstant: 150),
            mercadoLibreLogo.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        view.addSubview(productsSearchBar)
        NSLayoutConstraint.activate([
            productsSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Constraint.generalPadding),
            productsSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Constraint.generalPadding),
            productsSearchBar.topAnchor.constraint(equalTo: mercadoLibreLogo.bottomAnchor, constant: Constants.Constraint.generalPadding),
            productsSearchBar.heightAnchor.constraint(equalToConstant: Constants.Constraint.searchBarHeight)
        ])
    }
    
    //MARK: private methods - Keyboard events
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(SearchProductsView.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SearchProductsView.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
           // if keyboard size is not available for some reason, dont do anything
           return
        }
        let bottomOfTextField = productsSearchBar.convert(productsSearchBar.bounds, to: self.view).maxY;
        let topOfKeyboard = self.view.frame.height - keyboardSize.height

        if bottomOfTextField > topOfKeyboard {
            self.view.frame.origin.y = 0 - keyboardSize.height
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
}

//MARK: UISearchBarDelegate
extension SearchProductsView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchProductsViewDelegate?.sendSearchText(searchBar.text)
    }
}

//MARK: SearchProductsViewDelegateProtocol
extension SearchProductsView: SearchProductsViewDelegateProtocol {
    func navigateToProductViewWithData(_ data: SearchDTO) {
        coordinator?.showProductsViewWithData(data)
    }
    
    func showErrorEmptySearchText() {
        showErrorWithMessage(Constants.ErrorMessages.emptySearchText)
    }
}
