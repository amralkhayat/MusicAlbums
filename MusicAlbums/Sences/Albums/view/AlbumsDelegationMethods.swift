//
//  Albums_Delegation.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 31/07/2021.
//

import UIKit
extension Albums: AlbumsViewProtocol  {
    func showIndecator() {
        DispatchQueue.main.async { [weak self ] in
            guard let self = self else {return}
            self.showSpinner(onView: self.view)
        }
    }
    
    func hideIndecator() {
        DispatchQueue.main.async { [weak self ] in
            guard let self = self else {return}
            self.removeSpinner()
        }
    }
    
    func showError(_ Message: String) {
        self.presentAlert(withTitle: "Error", message: Message, actions: ["Ok" : UIAlertAction.Style.default])
    }
    
    func tableviewReload() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.albumsCollectionView.reloadData()
        }
    }
    
    
}
