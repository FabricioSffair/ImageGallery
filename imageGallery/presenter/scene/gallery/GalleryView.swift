//
//  GalleryView.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-07.
//

import Foundation

protocol GalleryView: class {
    func show(images: [Image], isLoadMore: Bool)
    func show(error: String)
    func togglePullRefresh(show: Bool)
}
