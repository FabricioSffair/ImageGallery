//
//  GalleryCoordinator.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-03.
//

import Foundation
import UIKit
class GalleryCoordinator: Coordinator {
 
    private let navigationController: UINavigationController
    private let sceneFactory: SceneFactory
    
    init(navigationController: UINavigationController,
         sceneFactory: SceneFactory = SceneFactory()) {
        self.navigationController = navigationController
        self.sceneFactory = sceneFactory
    }
    
    func start() {
        showHomeGallery()
    }
}

extension GalleryCoordinator {
    func showHomeGallery() {
        let viewController = sceneFactory.buildGalleryController(interactor: GalleryInteractor())
        navigationController.pushViewController(viewController, animated: true)
    }
}
