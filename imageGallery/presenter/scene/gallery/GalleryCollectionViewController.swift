//
//  GalleryCollectionViewController.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-03.
//

import UIKit
import PKHUD

private let reuseIdentifier = "Cell"

class GalleryCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var images: [Image] = []
    private var errorLabel: UILabel = UILabel()
    var presenter: GalleryPresenter?
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupErrorLabel()
        setupCollectionView()
        presenter?.reload()
        // Do any additional setup after loading the view.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        if let galleryCell = cell as? GalleryCollectionViewCell {
            galleryCell.loadImage(with: images[indexPath.item])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width - 5) / 2, height: (collectionView.frame.size.width - 5) / 2)
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(GalleryCollectionViewCell.nib, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.refreshControl = UIRefreshControl()
    }
    
    private func setupErrorLabel() {
        errorLabel = UILabel(frame: CGRect(x: 0,
                                           y: 0,
                                           width: collectionView.bounds.size.width,
                                           height: collectionView.bounds.size.height))
        errorLabel.numberOfLines = 2
        errorLabel.textColor = .black
        errorLabel.textAlignment = .center
    }
}

extension GalleryCollectionViewController: GalleryView {
    func show(images: [Image]) {
        self.images = images
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func show(error: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.errorLabel.text = error
            self.collectionView.backgroundView = self.errorLabel
        }
    }
    
    func toggleHUD(message: String?) {
        DispatchQueue.main.async {
            if let title = message {
                HUD.show(.labeledProgress(title: title, subtitle: nil))
            } else {
                HUD.hide()
            }
        }
    }
    
    func endPullRefresh() {
        DispatchQueue.main.async {
            self.collectionView.refreshControl?.endRefreshing()
        }
    }
    
    
}
