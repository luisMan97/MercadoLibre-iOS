//
//  ViewExtensions.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 24/06/21.
//

import SwiftUI

extension View {
    
    func add(_ searchBar: SearchBar) -> some View {
        self.modifier(SearchBarModifier(searchBar: searchBar))
    }
}
