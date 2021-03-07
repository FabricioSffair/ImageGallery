//
//  Page.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-03.
//

import Foundation

struct PageResponse: Decodable {
    struct Page: Decodable {
        let photo: [PhotoResponse]
    }
    let photos: Page?
}

struct PhotoResponse: Decodable {
    let id: String
    let title: String?
}
