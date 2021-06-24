//
//  MoviesView.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/06/21.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var viewModel: MoviesViewModel
        
    @State private var movie: Products.Product.Domain?
    
    private let columns = [
        GridItem(.flexible(minimum: 90), spacing: 20),
        GridItem(.flexible(minimum: 90), spacing: 20),
    ]
        
    var body: some View {
        LoadingView(isShowing: $viewModel.showProgress, text: viewModel.progressTitle) {
            NavigationView {
                VStack {
                    if viewModel.domain != nil {
                        if viewModel.domain!.isEmpty {
                            if !viewModel.searchText.isEmpty {
                                Text("Lo sentimos, no hemos encontrado resultados en la busqueda")
                                    .font(.system(.title3, design: .rounded))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom)
                            }
                            
                            Text("Puedes probar por ejemplo con Motorola en la barra de busqueda (o pulsa en intentar para probar la busqueda por la palabra sugerida Motorola)")
                                .font(.system(.body, design: .rounded))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                                .padding(.bottom)
                            
                            Button {
                                viewModel.getProducts("Motorola")
                            } label: {
                                Text("Intentar")
                            }
                        } else {
                            viewModel.domain.map { domain in
                                ScrollView {
                                    LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(domain) { movie in
                                            ProductItem(domain: movie, onTap: { movie in
                                                self.movie = movie
                                            })
                                        }
                                    }
                                    .padding(.all, 10)
                                }
                            }
                        }
                    }
                }.add(viewModel.searchBar)
                .navigationBarTitle("Productos")
                .sheet(item: $movie, content: {
                    MovieDetail(domain: $0, products: viewModel.domain ?? [])
                })
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image("mercado-libre-header")
                            .resizable()
                            .frame(width: 74, height: 28.5)
                    }
                }
                .alert(item: $viewModel.error) {
                    Alert(title: Text("Error"),
                          message: Text($0),
                          dismissButton: .default(Text("Ok"))
                    )
                }
            }
        }
    }
    
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesBuilder.createModule()
    }
}
