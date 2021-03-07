//
//  GalleryCoordinatorMock.swift
//  imageGalleryTests
//
//  Created by Fabrício Sperotto Sffair on 2021-03-05.
//

import Foundation
import UIKit

@testable import imageGallery
class GalleryCoordinatorMock: GalleryCoordinator {
    var hasStarted: Bool?
    
    override func start() {
        hasStarted = true
    }
}
