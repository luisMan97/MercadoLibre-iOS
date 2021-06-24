//
//  MoviesURLSessionDataSource.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/06/21.
//

import Foundation
import Combine

class MoviesURLSessionDataSource: RemoteMoviesDataSource {
    
    private let apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func getMovies(request: Products.Product.Request) -> AnyPublisher<[Products.Product.Domain]?, Error> {
        return getMoviesPublisher(request: request)
            .map(mapResponseToDomain)
            .eraseToAnyPublisher()
    }
    
}

private extension MoviesURLSessionDataSource {
    
    func getMoviesPublisher(request: Products.Product.Request) -> AnyPublisher<ProductResponseServer, Error> {
        let parameters = [
            "item": request.item
        ] as [String: Any]
        
        return APIManager.request(service: .Products(parameters))
    }
    
    private func mapResponseToDomain(_ serverResponse: ProductResponseServer) -> [Products.Product.Domain]? {
        serverResponse.toMovieDomainList()
    }
    
}
