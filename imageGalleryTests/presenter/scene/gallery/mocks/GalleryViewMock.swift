//
//  GalleryViewMock.swift
//  imageGalleryTests
//
//  Created by Fabrício Sperotto Sffair on 2021-03-07.
//

import Foundation

@testable import imageGallery

class GalleryViewMock: GalleryView {
    
    var isShowingPullRefresh: Bool?
    var presentedImages: [Image]?
    var presentedError: String?
    
    func show(images: [Image], isLoadMore: Bool) {
        presentedImages = images
    }
    
    func show(error: String) {
        presentedError = error
    }
    
    func toggleHUD(message: String?) {
        
    }
    
    func togglePullRefresh(show: Bool) {
        isShowingPullRefresh = show
    }
}
