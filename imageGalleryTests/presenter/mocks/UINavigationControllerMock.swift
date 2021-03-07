//
//  UINavigationControllerMock.swift
//  imageGalleryTests
//
//  Created by Fabrício Sperotto Sffair on 2021-03-05.
//

import Foundation
import UIKit

class UINavigationControllerMock: UINavigationController {
    var pushedViewController: UIViewController?
    var isAnimated: Bool?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        isAnimated = animated
    }
}
