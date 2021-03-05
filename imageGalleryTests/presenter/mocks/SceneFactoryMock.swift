//
//  SceneFactoryMock.swift
//  imageGalleryTests
//
//  Created by Fabrício Sperotto Sffair on 2021-03-05.
//

import Foundation

@testable import imageGallery

class SceneFactoryMock: SceneFactory {
    let galleryViewControllerMock: GalleryViewController?
    
    init(galleryViewController: GalleryViewController? = nil) {
        galleryViewControllerMock = galleryViewController
    }
    override func buildGalleryController(interactor: GalleryInteractor) -> GalleryViewController {
        galleryViewControllerMock!
    }
    
}
