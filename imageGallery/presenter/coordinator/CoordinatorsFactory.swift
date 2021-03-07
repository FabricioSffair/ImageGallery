//
//  CoordinatorsFactory.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-05.
//

import Foundation
import UIKit

class CoordinatorsFactory {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func buildGalleryCoordinator() -> GalleryCoordinator {
        return GalleryCoordinator(navigationController: navigationController)
    }
}
