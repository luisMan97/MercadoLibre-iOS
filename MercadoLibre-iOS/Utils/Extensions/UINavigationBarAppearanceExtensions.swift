//
//  UINavigationBarAppearanceExtensions.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 24/06/21.
//

import UIKit

extension UINavigationBarAppearance {
    
    func setup(backgroundColor: UIColor) -> UINavigationBarAppearance {
    
        let apperance = UINavigationBarAppearance()
        
        apperance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.titleBlueColor
        ]
        apperance.titleTextAttributes = [
            .foregroundColor: UIColor.titleBlueColor
        ]
        
        apperance.backgroundColor = backgroundColor
        
        return apperance
    }
    
}
