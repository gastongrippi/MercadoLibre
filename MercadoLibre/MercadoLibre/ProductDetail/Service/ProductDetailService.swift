//
//  ProductDetailService.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 26/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//

import Foundation

class ProductDetailService: ProductDetailServiceProtocol {
    let session = URLSession.shared

    //MARK: ProductDetailServiceProtocol
    func getProductDetailWithId(_ id: String, successBlock: @escaping (ProductDetail) -> (), errorBlock: @escaping (Error) -> ()) {
        let url = URL(string: "\(Constants.Endpoint.productDetail)\(id)/description")!
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            // Check the response
            print(response)
            
            // Check if an error occured
            if let error = error {
                // handle error
                errorBlock(error)
                return
            }
            
            guard let data = data else {
                // handle error
                return
            }

            // Serialize the data into an object
            do {
                print(String(data: data, encoding: .utf8))
                let productResponse = try JSONDecoder().decode(ProductDetail.self, from: data)
                successBlock(productResponse)
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        })
        task.resume()
    }
}
