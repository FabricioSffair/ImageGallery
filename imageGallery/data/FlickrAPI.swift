//
//  FlickrAPI.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-03.
//
// API key f9cc014fa76b098f9e82f1c288379ea1

import Foundation
import Moya


enum FlickrAPI {
    case searchPhotos(tag: String, page: Int)
    case getSizes(id: String)
}


extension FlickrAPI: TargetType {
    var apiKey: String { "f9cc014fa76b098f9e82f1c288379ea1" }
    
    var baseURL: URL {
        return URL(string: "https://api.flickr.com")!
    }
    
    var path: String {
        "/services/rest"
    }
    
    var method: Moya.Method {
        .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var parameters: [String: Any] {
        switch self {
        case .searchPhotos(let tag, let page):
            return ["method": "flickr.photos.search", "api_key": apiKey, "tags": tag, "page": page, "format": "json", "nojsoncallback": "1"]
        case .getSizes(let id):
            return ["method": "flickr.photos.getSizes", "api_key": apiKey, "photo_id": id, "format": "json", "nojsoncallback": "1"]
        }
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
