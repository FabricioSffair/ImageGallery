//
//  CoordinatorsFactoryMock.swift
//  imageGalleryTests
//
//  Created by Fabrício Sperotto Sffair on 2021-03-05.
//

import Foundation
import UIKit

@testable import imageGallery
class CoordinatorsFactoryMock: CoordinatorsFactory {
    let galleryCoordinatorMock: GalleryCoordinator
    init(galleryCoordinatorMock: GalleryCoordinator) {
        self.galleryCoordinatorMock = galleryCoordinatorMock
        super.init(navigationController: UINavigationController())
    }
    
    override func buildGalleryCoordinator() -> GalleryCoordinator {
        return galleryCoordinatorMock
    }
}
