//
//  GalleryInteractor.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-03.
//

import Foundation

class GalleryInteractor {
    private let repository: GalleryRepository
    
    init(galleryRepository: GalleryRepository = GalleryService()) {
        repository = galleryRepository
    }
    
    func fetchImages(with tag: String, for page: Int, completionBlock: @escaping ([Image], Error?) -> Void) {
        repository.searchImages(with: tag, page: page) { [weak self] (photosResponse, error) in
            guard let self = self else { return }
            if photosResponse.count > 0  {
                self.fetchImageUrls(photos: photosResponse, completionBlock: completionBlock)
            } else {
                completionBlock([], error)
            }
        }
    }
    
    private func fetchImageUrls(photos: [PhotoResponse], completionBlock: @escaping ([Image], Error?) -> Void) {
        let dispatchGroup = DispatchGroup()
        var images: [Image] = []
        for photo in photos {
            dispatchGroup.enter()
            repository.getSizes(for: photo.id) { (sizes, error) in
                for size in sizes {
                    if size.label == "Large Square" {
                        images.append(Image(imageURL: size.source))
                    }
                }
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: DispatchQueue.main) {
            completionBlock(images, nil)
        }
    }
}
