//
//  RemoteMoviesDataSource.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/06/21.
//

import Combine

protocol RemoteMoviesDataSource {
        
    func getMovies(request: Products.Product.Request) -> AnyPublisher<[Products.Product.Domain]?, Error>
    
}
