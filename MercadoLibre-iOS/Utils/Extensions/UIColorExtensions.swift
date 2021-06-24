//
//  UIColorExtensions.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/06/21.
//

import UIKit

extension UIColor {
    
    static var primaryColor: UIColor {
        UIColor(named: "primaryColor") ?? .blue
    }
    
    static var titleBlueColor: UIColor {
        UIColor(named: "titleBlueColor") ?? .blue
    }
    
    static var handlebarBackgroundGrayColor: UIColor {
        UIColor(named: "handlebarBackgroundGrayColor") ?? .lightGray
    }
    
    static var handlebarGrayColor: UIColor {
        UIColor(named: "handlebarGrayColor") ?? .gray
    }

}
