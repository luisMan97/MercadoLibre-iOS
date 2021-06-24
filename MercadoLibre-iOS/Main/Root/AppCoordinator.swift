//
//  AppCoordinator.swift
//  MercadoLibre-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/06/21.
//

import SwiftUI
import CoreData

class AppCoordinator {
    
    private(set) var window: UIWindow?
    private var scene: UIScene
    
    init(scene: UIScene) {
        self.scene = scene
    }

    func start() {
        let contentView = ContentView()
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
}
