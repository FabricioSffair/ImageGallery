//
//  GalleryPresenter.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-03.
//

import Foundation

class GalleryPresenter {
    
    private let interactor: GalleryInteractor
    private weak var view: GalleryView?
    
    private var page: Int = 1
    private var currentTag: String = "kittens"
    
    init(view: GalleryView, interactor: GalleryInteractor = GalleryInteractor()) {
        self.interactor = interactor
        self.view = view
    }
    
    func reload() {
        page = 1
        fetchImages()
    }
    
    private func fetchImages() {
        interactor.fetchImages(with: currentTag, for: page) { [weak self] (images, error) in
            guard let self = self else { return }
            if let error = error {
                self.view?.show(error: error.localizedDescription)
            }
            else if images.count > 0 {
                self.view?.show(images: images)
            } else {
                self.view?.show(error: "No images were found containing \(self.currentTag)")
            }
        }
    }
}

protocol GalleryView: class {
    func show(images: [Image])
    func show(error: String)
    func toggleHUD(message: String?)
    func endPullRefresh()
}


extension String: Error {}
