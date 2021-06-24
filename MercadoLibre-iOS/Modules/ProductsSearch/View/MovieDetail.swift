//
//  MovieDetail.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/06/21.
//

import SwiftUI

struct MovieDetail: View {
    
    var domain: Products.Product.Domain
    var products: [Products.Product.Domain]
    
    @State private var isShowingWebView = false
    @State private var isShowingError = false
    
    private let rows = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            VStack {
                HandleBar()
                    .padding(.vertical, 10)
                
            }.frame(minWidth: 0, maxWidth: .infinity)
            .background(Color(.handlebarBackgroundGrayColor))
            
            NavigationView {
                ScrollView {
                    VStack {
                        Text(domain.condition)
                            .font(.body)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                            .padding(.top)
                        
                        Text(domain.title)
                            .font(.title2)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.primary)
                        
                        AsyncImage(url: URL(string: domain.thumbnail)!,
                                        placeholder: { Text("Loading ...") },
                                        image: { Image(uiImage: $0) })
                            .frame(maxWidth: UIScreen.main.bounds.width - 40)
                            .padding()
                        
                        Text("$ \(domain.price)")
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                        
                        Text("$ \(domain.originalPrice)")
                            .strikethrough(true, color: .gray)
                            .font(.body)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                        
                        Button(action: {
                            if ApiTool.isConnected {
                                isShowingWebView = true
                            } else {
                                isShowingError = true
                            }
                        }, label: {
                            Text("Ver más")
                        }).padding(.vertical)
                        
                        Text("Productos promocionados")
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.primary)
                    }.padding(.leading)
                    
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: rows, spacing: 20) {
                            ForEach(products) { movie in
                                ProductItem(domain: movie, onTap: { movie in
                                    
                                }).frame(width: UIScreen.main.bounds.width / 3)
                            }
                        }.padding(.vertical)
                    }.padding(.bottom, 50)
                    
                    NavigationLink(destination: WebView(request: URLRequest(url: URL(string: domain.permalink)!)), isActive: $isShowingWebView) { EmptyView() }
                    
                    }.navigationBarHidden(true)
                    .navigationBarTitleDisplayMode(.inline)
                    .alert(isPresented: $isShowingError) {
                        Alert(title: Text("Error"),
                          message: Text("Para acceder a esta funcionalidad necesitas conección a internet."),
                          dismissButton: .default(Text("Ok"))
                    )
                }
            }.padding(.top, -10)

        }
    }
    
}
