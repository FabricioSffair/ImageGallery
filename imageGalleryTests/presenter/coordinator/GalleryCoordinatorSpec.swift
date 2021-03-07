//
//  GalleryCoordinatorSpec.swift
//  imageGalleryTests
//
//  Created by Fabrício Sperotto Sffair on 2021-03-05.
//

import Foundation

import Quick
import Nimble
import UIKit

@testable import imageGallery

class GalleryCoordinatorSpec: QuickSpec {
    override func spec() {
        var sceneFactoryMock: SceneFactoryMock!
        var navigationControllerMock: UINavigationControllerMock!
        var galleryViewController: GalleryViewController!
        var sut: GalleryCoordinator!
        
        describe("App Coordinator") {
            beforeEach {
                galleryViewController = GalleryViewController()
                navigationControllerMock = UINavigationControllerMock()
                sceneFactoryMock = SceneFactoryMock(galleryViewController: galleryViewController)
                sut = GalleryCoordinator(navigationController: navigationControllerMock, sceneFactory: sceneFactoryMock)
            }
            
            describe("On Start") {
                it("Start Image Gallery View Controller") {
                    sut.showHomeGallery()
                    expect(navigationControllerMock.pushedViewController)
                        .to(equal(galleryViewController))
                    expect(navigationControllerMock.isAnimated)
                        .to(beTrue())
                }
            }
        }
    }
}
