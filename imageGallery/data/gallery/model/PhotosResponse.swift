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
    let photos: Page
}

struct PhotoResponse: Decodable {
    let id: String
    let title: String?
    let farm: Int
}


struct SizesResponse: Decodable {
    struct Sizes: Decodable {
        let size: [Size]
    }
    let sizes: Sizes
}

struct Size: Decodable {
    let label: String
    let url: String
}
