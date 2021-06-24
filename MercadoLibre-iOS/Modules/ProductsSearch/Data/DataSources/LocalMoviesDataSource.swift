//
//  LocalMoviesDataSource.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/06/21.
//

import Foundation

protocol LocalMoviesDataSource {
    
    func saveMovie(request: Products.Product.Domain) -> Bool
    
}
