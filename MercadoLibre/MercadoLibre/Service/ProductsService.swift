//
//  ProductsService.swift
//  MercadoLibre
//
//  Created by Gaston Daniel Gabriel Grippi on 20/09/2020.
//  Copyright © 2020 Gaston Daniel Gabriel Grippi. All rights reserved.
//
import Foundation

class ProductsService: ProductServiceProtocol {
    let session = URLSession.shared

    //MARK: ProductServiceProtocol
    func getProductsWithName(_ name: String, successBlock: @escaping (ProductResponse) -> (), errorBlock: @escaping (Error) -> ()) {
        let url = URL(string: "\(Constants.Endpoint.productSearch)\(name)")!
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
                let productResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
                successBlock(productResponse)
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        })
        task.resume()
    }
    
    
    
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
