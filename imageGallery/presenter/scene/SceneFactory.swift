//
//  SceneFactory.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-03.
//

import Foundation


class SceneFactory {
    func buildGalleryController(interactor: GalleryInteractor) -> GalleryCollectionViewController {
        let viewController = GalleryCollectionViewController()
        let presenter = GalleryPresenter(view: viewController)
        viewController.presenter = presenter
        return viewController
    }
}
