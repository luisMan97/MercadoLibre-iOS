//
//  MoviesViewModel.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/06/21.
//

import Combine
import Foundation

class MoviesViewModel: ObservableObject {
    
    // Internal Output Events Properties
    @Published var showProgress = false
    @Published var domain: [Products.Product.Domain]?
    @Published var error: String?
    @Published var isSavedMovie = false
    
    // Internal Input Properties
    @Published var searchText: String = ""
    
    // Internal Properties
    var searchBar = SearchBar()
    var progressTitle = ""
    
    // Private Properties
    private var subscriptions: Set<AnyCancellable> = []
    
    // Interactor
    private var getMoviesUseCase: GetProductsUseCase
    
    // MARK: - Initializers
    
    init(getMoviesUseCase: GetProductsUseCase) {
        self.getMoviesUseCase = getMoviesUseCase
        publishedAssign()
        search()
    }
    
    // MARK: - Internal Methods
    
    func getProducts(_ item: String) {
        guard ApiTool.isConnected else {
            DispatchQueue.main.async {
                self.error = "No tienes conexión a internet"
            }
           
            return
        }
        
        progressTitle = "Cargando productos..."
        showProgress = true
        
        getMoviesUseCase.invoke(request: .init(item: item))?
            .sink(receiveCompletion: { [weak self] (subscriptionCompletion: Subscribers.Completion<Error>) in
                if case let .failure(error) = subscriptionCompletion {
                    self?.error = error.localizedDescription
                }
                
                self?.showProgress = false
            }, receiveValue: { [weak self] (value: [Products.Product.Domain]?) in
                self?.domain = value
            })
            .store(in: &subscriptions)
    }
    
    // MARK: - Private Methods
    
    private func publishedAssign() {
        searchBar.$text
            .assign(to: \.searchText, on: self)
            .store(in: &subscriptions)
    }
    
    private func search() {
        $searchText
            .debounce(for: .milliseconds(800), scheduler: RunLoop.main) // debounces the string publisher, such that it delays the process of sending request to remote server.
            .removeDuplicates()
            .map({ (string) -> String? in
                if string.count < 1 {
                    self.domain = []
                    return nil
                }
                
                return string
            }) // prevents sending numerous requests and sends nil if the count of the characters is less than 1.
            .compactMap{ $0 } // removes the nil values so the search string does not get passed down to the publisher chain
            .sink { (_) in
                //
            } receiveValue: { [self] (searchField) in
                getProducts(searchField)
            }.store(in: &subscriptions)
    }

}
