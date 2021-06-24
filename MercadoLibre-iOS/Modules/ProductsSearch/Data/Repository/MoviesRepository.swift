//
//  MoviesRepository.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/06/21.
//

import Combine

class MoviesRepository: ObservableObject {
    
    private var remoteDataSource: RemoteMoviesDataSource
    
    init(remoteDataSource: RemoteMoviesDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getMovies(request: Products.Product.Request) -> AnyPublisher<[Products.Product.Domain]?, Error>? {
        remoteDataSource.getMovies(request: request)
            .eraseToAnyPublisher()
    }
    
}
