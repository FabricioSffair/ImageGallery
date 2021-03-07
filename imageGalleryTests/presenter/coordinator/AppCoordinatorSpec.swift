//
//  AppCoordinatorSpec.swift
//  imageGalleryTests
//
//  Created by Fabrício Sperotto Sffair on 2021-03-05.
//

import Foundation
import Quick
import Nimble
import UIKit

@testable import imageGallery

class AppCoordinatorSpec: QuickSpec {
    override func spec() {
        var windowMock: UIWindowMock!
        var navigationControllerMock: UINavigationController!
        var galleryCoordinatorMock: GalleryCoordinatorMock!
        var coordinatorsFactoryMock: CoordinatorsFactoryMock!
        var sut: AppCoordinator!
        
        describe("AppCoordinator") {
            beforeEach {
                windowMock = UIWindowMock()
                navigationControllerMock = UINavigationController()
                galleryCoordinatorMock = GalleryCoordinatorMock(navigationController: UINavigationController())
                coordinatorsFactoryMock = CoordinatorsFactoryMock(galleryCoordinatorMock: galleryCoordinatorMock)
                sut = AppCoordinator(window: windowMock, navigationController: navigationControllerMock, coordinatorsFactory: coordinatorsFactoryMock)
            }
            
            describe("On init") {
                it("Setup Window") {
                    expect(windowMock.rootViewController)
                        .to(equal(navigationControllerMock))
                    expect(windowMock.hasMakeKeyAndVisible)
                        .to(beTrue())
                }
            }
            
            describe("On Start") {
                it("Start Gallery Coordinator") {
                    sut.start()
                    expect(galleryCoordinatorMock.hasStarted)
                        .to(beTrue())
                }
            }
        }
    }
}

