//
//  GetMoviesUseCase.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/06/21.
//

import Combine

class GetProductsUseCase: ObservableObject {
    
    // Repository
    private var repository: MoviesRepository
    
    // MARK: - Initializers
    
    init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    // MARK: - Internal Methods
    
    func invoke(request: Products.Product.Request) -> AnyPublisher<[Products.Product.Domain]?, Error>? {
        repository.getMovies(request: request)
    }

}
