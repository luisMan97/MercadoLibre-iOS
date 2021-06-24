//
//  UINavigationBarExtenions.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 24/06/21.
//

import UIKit

extension UINavigationBar {
    
    func setup(backgroundColor: UIColor) {
        let apperance = UINavigationBar.appearance()
        let standardAppearance = UINavigationBarAppearance().setup(backgroundColor: backgroundColor)
        
        apperance.tintColor = .titleBlueColor
    
        apperance.standardAppearance = standardAppearance
        apperance.compactAppearance = standardAppearance
        apperance.scrollEdgeAppearance = standardAppearance
    }
    
}
