//
//  RefreshControl.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-07.
//

import Foundation
import UIKit

extension UIRefreshControl {
    func beginRefreshingManually() {
        if let scrollView = superview as? UIScrollView {
            scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y - frame.height), animated: true)
        }
        beginRefreshing()
    }
}
