//
//  MoviesModels.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/06/21.
//

import Foundation

enum Products {
    
    enum Product {
        
        struct Request {
            let item: String
        }
        
        struct Response: Decodable {
            let title: String?
            let thumbnail: String?
            let permalink: String?
            let price: Double?
            let originalPrice: Double?
            let condition: String?
            
            private enum CodingKeys: String, CodingKey {
                case title
                case thumbnail
                case permalink
                case price
                case originalPrice = "original_price"
                case condition
            }
        }
        
        struct Domain: Identifiable {
            let id = UUID()
            let title: String
            let thumbnail: String
            let permalink: String
            var image = Data()
            let price: Double
            let originalPrice: Double
            let condition: String
        }
        
    }
    
}

extension Products.Product.Response {
    
    func toDomain() -> Products.Product.Domain {
        .init(title: title ?? "",
              thumbnail: thumbnail ?? "",
              permalink: permalink ?? "",
              price: price ?? 0,
              originalPrice: originalPrice ?? 0,
              condition: condition ?? ""
        )
    }
    
}
