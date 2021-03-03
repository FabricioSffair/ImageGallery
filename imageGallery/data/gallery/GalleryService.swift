//
//  GalleryService.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-03.
//

import Foundation
import Moya

class GalleryService: GalleryRepository {
    let provider = MoyaProvider<FlickrAPI>(callbackQueue: DispatchQueue.global(qos: .utility))
    
    func searchImages(with tag: String, page: Int, completionBlock: @escaping ([PhotoResponse], Error?) -> Void) {
        provider.request(.searchPhotos(tag: tag, page: page)) { result in
            switch result {
            case .success(let moyaResponse):
                do {
                    let response = try JSONDecoder().decode(PageResponse.self, from: moyaResponse.data)
                    let photos = response.photos.photo
                    completionBlock(photos, nil)
                } catch let error {
                    completionBlock([], error)
                }
            case .failure(let error):
                completionBlock([], error)
            }
        }
    }
    
    func getSizes(for id: String, completionBlock: @escaping ([Size], Error?) -> Void) {
        provider.request(.getSizes(id: id)) { result in
            switch result {
            case .success(let moyaResponse):
                do {
                    let response = try JSONDecoder().decode(SizesResponse.self, from: moyaResponse.data)
                    completionBlock(response.sizes.size, nil)
                } catch let error {
                    completionBlock([], error)
                }
            case .failure(let error):
                completionBlock([], error)
            }
        }
    }
}
