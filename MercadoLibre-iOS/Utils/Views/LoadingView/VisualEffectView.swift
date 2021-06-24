//
//  VisualEffectView.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 24/06/21.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    
    var effect: UIVisualEffect?
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        UIVisualEffectView()
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        //uiView.alpha = 0.9
        uiView.effect = effect
    }
    
}
