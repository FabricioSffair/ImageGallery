//
//  GalleryCollectionViewController.swift
//  imageGallery
//
//  Created by Fabrício Sperotto Sffair on 2021-03-03.
//

import UIKit

private let reuseIdentifier = "Cell"

class GalleryCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var images: [Image] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let interactor: GalleryInteractor
    
    init(interactor: GalleryInteractor = GalleryInteractor(galleryRepository: GalleryService())) {
        self.interactor = interactor
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        interactor.fetchImages(with: "kittens", for: 1) { (images, error) in
            print(images)
        }
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: view.frame.width, height: 250)
    }
}
