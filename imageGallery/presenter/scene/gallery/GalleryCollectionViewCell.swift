//
//  GalleryCollectionViewCell.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-03.
//

import UIKit
import Kingfisher
class GalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    static var nib: UINib {
        return UINib(nibName: "GalleryCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadImage(with image: Image) {
        guard let url = URL(string: image.imageURL) else { return }
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url,
                              options: [
                                .processor(processor),
                                .transition(.fade(0.25))
                              ])
    }
}
