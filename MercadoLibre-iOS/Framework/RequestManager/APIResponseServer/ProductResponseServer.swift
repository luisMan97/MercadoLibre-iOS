//
//  MovieResponseServer.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/06/21.
//

import Foundation

struct ProductResponseServer: Decodable {
    
    let results: [Products.Product.Response]?
    
}

extension ProductResponseServer {
    
    func toMovieDomainList() -> [Products.Product.Domain]? {
        results?.map {
            $0.toDomain()
        }
    }
    
}
