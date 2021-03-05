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
    private let coordinatorsFactory: CoordinatorsFactory
    
    init(window: UIWindow = UIWindow(),
         navigationController: UINavigationController,
         coordinatorsFactory: CoordinatorsFactory) {
        self.window = window
        self.navigationController = navigationController
        self.coordinatorsFactory = coordinatorsFactory
        setupWindow()
    }
    
    private func setupWindow() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {
        coordinator = coordinatorsFactory.buildGalleryCoordinator()
        coordinator?.start()
    }
}
