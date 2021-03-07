//
//  SizeResponse.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-07.
//

import Foundation

struct SizesResponse: Decodable {
    struct Sizes: Decodable {
        let size: [Size]
    }
    let sizes: Sizes
}

struct Size: Decodable {
    let label: String
    let source: String
}
