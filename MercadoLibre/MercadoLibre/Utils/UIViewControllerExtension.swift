//
//  UIViewControllerExtension.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 20/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import UIKit

extension UIViewController {
    func showErrorWithMessage(_ message: String) {
        showErrorWithMessage(message, completionBlock: {})
    }
    
    func showErrorWithMessage(_ message: String, completionBlock: @escaping () -> Void) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) -> Void in
            completionBlock()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func getNavigationBarHeight() -> CGFloat {
        if let navigationHeight = navigationController?.navigationBar.frame.height {
            return navigationHeight + UIApplication.shared.statusBarFrame.height
        } else {
            return UIApplication.shared.statusBarFrame.height
        }
    }
}
