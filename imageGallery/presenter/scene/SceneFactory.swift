//
//  SceneFactory.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-03.
//

import Foundation


class SceneFactory {
    func buildGalleryController(interactor: GalleryInteractor) -> GalleryViewController {
        let viewController = GalleryViewController()
        let presenter = GalleryPresenter(view: viewController)
        viewController.presenter = presenter
        return viewController
    }
}
