//
//  GalleryPresenterSpec.swift
//  imageGalleryTests
//
//  Created by Fabrício Sperotto Sffair on 2021-03-07.
//

import Foundation
import Quick
import Nimble

@testable import imageGallery

class GalleryPresenterSpec: QuickSpec {
    override func spec() {
        var galleryInteractorMock: GalleryInteractor!
        var viewMock: GalleryViewMock!
        
        var sut: GalleryPresenter!
        
        describe("Galler Presenter") {
            beforeEach {
                viewMock = GalleryViewMock()
                galleryInteractorMock = GalleryInteractor()
            }
            describe("On user search") {
                it("Fetch and show images related to searched tag") {
                    let imagesMock = [Image(imageURL: ""), Image(imageURL: "a"), Image(imageURL: "b")]
                    galleryInteractorMock = GalleryInteractorMock(imagesMock: imagesMock)
                    sut = GalleryPresenter(view: viewMock, interactor: galleryInteractorMock)
                    sut.reload(with: "kitten")
                    expect(viewMock.presentedImages).to(equal(imagesMock))
                    
                }
                it("Fetch and show error if no images were found containing specified tag") {
                    let imagesMock = [Image]()
                    let galleryInteractorMock = GalleryInteractorMock(imagesMock: imagesMock)
                    sut = GalleryPresenter(view: viewMock, interactor: galleryInteractorMock)
                    let tag = "Tag with Error"
                    sut.reload(with: tag)
                    expect(viewMock.presentedError).to(equal("No images were found containing \(tag)"))
                }
            }
        }
    }
}
