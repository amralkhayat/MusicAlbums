//
//  MainScreen.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import UIKit
class MainScreen: UIViewController {
    //MARK:- IBOUTLETS
    @IBOutlet weak var mainScreenCollectionView: UICollectionView! {
        didSet{
            mainScreenCollectionView.delegate = self
            mainScreenCollectionView.dataSource = self
            mainScreenCollectionView.registerCell(cellClass: LocalAlbumCell.self)
        }
    }
    //MARK:- Properties
    var presenter:MainScreenVCPresenter?
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }

    //MARK:- Helper
    
    private func configurationUI(){
        mainScreenCollectionView.collectionViewLayout =  layout
        MainScreenRouter.mainScreenRouterVC(view: self)
        navifationBarConfig()
    }
    
    private func navifationBarConfig(){
        
        let searchBarItem =  UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                                            style: .plain, target: self, action: #selector(searchTapped))
        searchBarItem.tintColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationItem.rightBarButtonItem = searchBarItem
        navigationItem.title =  "Albums"

    
    }

    //MARK:- Selector
    @objc func searchTapped () {
      let searchViewController =  Search()
        navigationController?.pushViewController(searchViewController, animated: true)
    }
}
extension MainScreen: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelect(item: indexPath.item)
    }
}

extension MainScreen: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.numberOfItems ?? 0 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let albumCell = collectionView.dequeue(indexPath: indexPath) as LocalAlbumCell
        presenter?.configurationAlbumCell(cell: albumCell , index: indexPath.item)
        return albumCell
    }
    
    
}
