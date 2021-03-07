//
//  GalleryViewController.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-03.
//

import UIKit
import PKHUD

private let reuseIdentifier = "Cell"

class GalleryViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var logoImageView: UIImageView!
    let refreshControl = UIRefreshControl()
    var images: [Image] = [] {
        didSet {
            logoImageView.isHidden = images.count > 0
        }
    }
    private var errorLabel: UILabel = UILabel()
    var presenter: GalleryPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupSearchBar()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let logo = UIImageView(image: UIImage(named: "flickr-logo"))
        logo.contentMode = .scaleAspectFit
        navigationItem.titleView = logo
        navigationItem.titleView?.sizeToFit()
    }
    
    private func setupCollectionView() {
        refreshControl.addTarget(self, action: #selector(reload(_:)), for: .valueChanged)
        collectionView.refreshControl = refreshControl
        collectionView.backgroundColor = .white
        collectionView.register(GalleryCollectionViewCell.nib, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
    @objc private func reload(_ sender: Any) {
        presenter?.reload()
    }
}

extension GalleryViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        presenter?.reload(with: searchText)
        searchBar.resignFirstResponder()
    }
    
}

// MARK: UICollectionViewDataSource
extension GalleryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        if let galleryCell = cell as? GalleryCollectionViewCell {
            galleryCell.loadImage(with: images[indexPath.item])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item >= images.count - 10 {
            presenter?.loadNextPage()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width - 10) / 2, height: (collectionView.frame.size.width - 10) / 2)
    }
}



extension GalleryViewController: GalleryView {
    func show(images: [Image], isLoadMore: Bool) {
        if isLoadMore {
            self.images.append(contentsOf: images)
        } else {
            self.images = images
        }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func show(error: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.errorLabel.text = error
            HUD.show(.labeledError(title: "Error", subtitle: error))
            HUD.hide(afterDelay: 4)
        }
    }
    
    func togglePullRefresh(show: Bool) {
        DispatchQueue.main.async {
            if show {
                self.collectionView.refreshControl?.beginRefreshingManually()
            } else {
                self.collectionView.refreshControl?.endRefreshing()
            }
        }
    }
}
