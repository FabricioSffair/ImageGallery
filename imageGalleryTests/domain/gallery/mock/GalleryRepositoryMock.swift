//
//  GalleryRepositoryMock.swift
//  imageGalleryTests
//
//  Created by Fabrício Sperotto Sffair on 2021-03-07.
//

import Foundation

@testable import imageGallery

class GalleryRepositoryMock: GalleryRepository {
    
    let photoResponseMock: [PhotoResponse]
    var sizesMock: [Size]
    var isSearchImagesBeingCalled: Bool = false
    var isGetSizesBeingCalled: Bool = false
    let errorMock: Error?
    
    init(photoResponseMock: [PhotoResponse] = [], sizesMock: [Size] = [], errorMock: Error? = nil) {
        self.photoResponseMock = photoResponseMock
        self.sizesMock = sizesMock
        self.errorMock = errorMock
    }
    
    func searchImages(with tag: String, page: Int, completionBlock: @escaping ([PhotoResponse], Error?) -> Void) {
        isSearchImagesBeingCalled = true
        completionBlock(photoResponseMock, errorMock)
    }
    
    func getSizes(for id: String, completionBlock: @escaping ([Size], Error?) -> Void) {
        isGetSizesBeingCalled = true
        let size = [sizesMock.removeFirst() ?? Size(label: "", source: "")]
        completionBlock(size, errorMock)
    }
    
    
}
