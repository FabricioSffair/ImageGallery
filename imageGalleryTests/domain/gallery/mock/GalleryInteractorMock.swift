//
//  GalleryInteractorMock.swift
//  imageGalleryTests
//
//  Created by Fabrício Sperotto Sffair on 2021-03-07.
//

import Foundation
@testable import imageGallery

class GalleryInteractorMock: GalleryInteractor {
    var imagesMock: [Image]
    
    init(imagesMock: [Image] = []) {
        self.imagesMock = imagesMock
    }
    
    override func fetchImages(with tag: String, for page: Int, completionBlock: @escaping ([Image], Error?) -> Void) {
        completionBlock(imagesMock, nil)
    }
}
