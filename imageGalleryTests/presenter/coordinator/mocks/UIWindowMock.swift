//
//  UIWindowMock.swift
//  imageGalleryTests
//
//  Created by Fabrício Sperotto Sffair on 2021-03-05.
//

import Foundation
import UIKit

class UIWindowMock: UIWindow {
    var hasMakeKeyAndVisible: Bool?
    
    override func makeKeyAndVisible() {
        hasMakeKeyAndVisible = true
    }
}
