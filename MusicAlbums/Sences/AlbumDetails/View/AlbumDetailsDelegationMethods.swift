//
//  AlbumDetailsDelegationMethods.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 05/08/2021.
//

import UIKit
extension AlbumDetailsViewController: AlbumDetailsViewProtocol{
  
    
    func showAlbumImage(url: String) {
        DispatchQueue.main.async {
            self.headerView?.imageView.loadImage(url)
         }

    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.albumDetailsTableView.reloadData()
        }
    
    }
    
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
    
    func show(_ Message: String) {
        DispatchQueue.main.async { [weak self ] in
            guard let self = self else {return}
            self.view.showToast(toastMessage: Message, duration: 3)
        }
    }
    
    func deleteObject(_ Message: String) {
        self.view.showToast(toastMessage: Message, duration: 3)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
}
