//
//  UICollectionView+Extension.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 31/07/2021.
//

import UIKit
extension UICollectionView {
    
    func registerCell<Cell: UICollectionViewCell>(cellClass: Cell.Type){
        //MARK: Generic Register cells
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: Cell.self))
    }


    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell{
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }

}
