//
//  GalleryRepository.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-07.
//

import Foundation

protocol GalleryRepository {
    func searchImages(with tag: String, page: Int, completionBlock: @escaping ([PhotoResponse], Error?) -> Void)
    func getSizes(for id: String, completionBlock: @escaping ([Size], Error?) -> Void)
}
