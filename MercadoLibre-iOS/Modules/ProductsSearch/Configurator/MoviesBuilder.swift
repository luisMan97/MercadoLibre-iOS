//
//  MoviesBuilder.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/06/21.
//

import Foundation
import CoreData

class MoviesBuilder {
    
    class func createModule() -> MoviesView {
        let apiManager = APIManager()
                
        let remoteDataSource = MoviesURLSessionDataSource(apiManager: apiManager)
        
        let repository: MoviesRepository = MoviesRepository(remoteDataSource: remoteDataSource)
        
        // Interactor
        let getMoviesUseCase = GetProductsUseCase(repository: repository)
        
        // ViewModel
        let viewModel = MoviesViewModel(getMoviesUseCase: getMoviesUseCase)
        
        return MoviesView(viewModel: viewModel)
    }
    
}
