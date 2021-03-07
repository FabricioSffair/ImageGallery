//
//  GalleryInteractorSpec.swift
//  imageGalleryTests
//
//  Created by Fabrício Sperotto Sffair on 2021-03-07.
//

import Foundation
import Quick
import Nimble

@testable import imageGallery

class GalleryInteractorSpec: QuickSpec {
    override func spec() {
        let photosResponseMock = [PhotoResponse(id: "1", title: "Testing", farm: 65),
                                  PhotoResponse(id: "2", title: "Testing 2", farm: 65),
                                  PhotoResponse(id: "3", title: "Testing 3", farm: 65),
                                  PhotoResponse(id: "4", title: "Testing 4", farm: 65)]
        let sizesMock = [Size(label: "Large Square", source: "a"), Size(label: "Large Square", source: "b"), Size(label: "Large Square", source: "c"), Size(label: "Large Square", source: "d")]
        let expectedImages = [Image(imageURL: "a"), Image(imageURL: "b"), Image(imageURL: "c"), Image(imageURL: "d")]
        
        var repositoryMock: GalleryRepositoryMock!
        var sut: GalleryInteractor!
        
        describe("Gallery Interactor") {
            describe("Search") {
                it("Images with tag when they have not been retrieved yet") {
                    repositoryMock = GalleryRepositoryMock(photoResponseMock: photosResponseMock, sizesMock: sizesMock)
                    sut = GalleryInteractor(galleryRepository: repositoryMock)
                    waitUntil(timeout: .seconds(5)) { (done) in
                        sut.fetchImages(with: "tag", for: 1) { (images, error) in
                            expect(images).to(equal(expectedImages))
                            expect(repositoryMock.isSearchImagesBeingCalled)
                                .to(beTrue())
                            expect(repositoryMock.isGetSizesBeingCalled)
                                .to(beTrue())
                            done()
                        }
                    }
                }
                
                it("fire error when failing to fetch images from service") {
                    let errorMock = ErrorMock.mock
                    repositoryMock = GalleryRepositoryMock(errorMock: errorMock)
                    sut = GalleryInteractor(galleryRepository: repositoryMock)
                    waitUntil(timeout: .seconds(5)) { done in
                        sut.fetchImages(with: "", for: 1) { (images, error) in
                            if let error = error {
                                expect(error.localizedDescription == errorMock.localizedDescription).to(beTrue())
                            } else {
                                fail()
                            }
                            done()
                        }
                    }
                }
            }
        }
    }
}
