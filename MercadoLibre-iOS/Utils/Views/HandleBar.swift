//
//  HandleBar.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 24/06/21.
//

import SwiftUI

struct HandleBar: View {
    var body: some View {
        Rectangle()
            .frame(width: 40, height: 6)
            .foregroundColor(Color(.handlebarGrayColor))
            .cornerRadius(8)
    }
}
