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
    private var currentTag: String = ""
    
    init(view: GalleryView, interactor: GalleryInteractor = GalleryInteractor()) {
        self.interactor = interactor
        self.view = view
    }
    
    func reload(with tag: String? = nil) {
        page = 1
        currentTag = tag ?? currentTag
        fetchImages()
    }
    
    func loadNextPage() {
        page += 1
        fetchImages()
    }
    
    private func fetchImages() {
        self.view?.togglePullRefresh(show: true)
        guard !currentTag.isEmpty else {
            self.view?.togglePullRefresh(show: false)
            return
        }
        interactor.fetchImages(with: currentTag, for: page) { [weak self] (images, error) in
            guard let self = self else { return }
            self.view?.togglePullRefresh(show: false)
            if let error = error {
                self.view?.show(error: error.localizedDescription)
            }
            else if images.count > 0 {
                self.view?.show(images: images, isLoadMore: self.page > 1)
            } else {
                self.view?.show(error: "No images were found containing \(self.currentTag)")
            }
        }
    }
}
