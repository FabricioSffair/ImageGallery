//
//  AppCoordinator.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-03.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    private var coordinator: Coordinator?
    
    init(window: UIWindow = UIWindow(),
         navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
        setupWindow()
    }
    
    private func setupWindow() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {
        coordinator = GalleryCoordinator(navigationController: navigationController)
        coordinator?.start()
    }
}
