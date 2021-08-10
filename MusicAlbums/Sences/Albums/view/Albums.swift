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
    var presenter: AlbumsVCPresenter?
    let layout:UICollectionViewCompositionalLayout = {
        let fraction: CGFloat = 1/2
        let inset: CGFloat = 0.2
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(fraction))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize:  groupSize, subitems: [item])
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)

        return UICollectionViewCompositionalLayout(section: section)
    }()
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationUI()
    }
    //MARK:- Helper
    
    private func configurationUI(){
        albumsCollectionView.collectionViewLayout =  layout
        navigationItem.title = "Albums"
        presenter?.viewDidLoad()
    }


}
//MARK:- TableView Methods 
extension Albums: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelect(item: indexPath.item)
    }
}

extension Albums: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfrow ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let albumCell = collectionView.dequeue(indexPath: indexPath) as AlbumCell
        presenter?.configurationArtistCell(cell: albumCell, index: indexPath.item)
        return albumCell
    }
    
}

extension Albums: UICollectionViewDataSourcePrefetching{
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        presenter?.prefetchRowsAt(indexPath: indexPaths)
    }
    
}
