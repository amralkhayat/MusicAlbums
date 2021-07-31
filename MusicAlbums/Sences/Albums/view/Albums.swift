//
//  Albums.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import UIKit
class Albums: UIViewController {

    //MARK:- IBOUTLETS
    @IBOutlet weak var albumsCollectionView: UICollectionView! {
        didSet{
            albumsCollectionView.delegate = self
            albumsCollectionView.dataSource = self
            albumsCollectionView.registerCell(cellClass: AlbumCell.self)
        }
    }
    //MARK:- Properties
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //MARK:- Helper
    //MARK:- Selector

}

extension Albums: UICollectionViewDelegate{
    
}

extension Albums: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
