//
//  MovieItem.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/06/21.
//

import SwiftUI

struct ProductItem: View {
    
    var domain: Products.Product.Domain
    var onTap: (_ item: Products.Product.Domain) -> Void
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: domain.thumbnail)!,
                                placeholder: { Text("Loading...") },
                                image: { Image(uiImage: $0).resizable() })
                .frame(maxWidth: 90, maxHeight: 90)
                
            Text(domain.title)
                .font(.caption)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .foregroundColor(.primary)
                .padding(.top)
            
            Text("$ \(domain.price.stringWithoutZeroFraction)")
                .font(.body)
                .multilineTextAlignment(.leading)
                .foregroundColor(.primary)
            
        }.padding(.top)
        .onTapGesture {
            onTap(domain)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color(white: 0.95))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
}
