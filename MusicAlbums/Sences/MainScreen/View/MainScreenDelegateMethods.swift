//
//  MainScreenDelegateMethods.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 04/08/2021.
//

import UIKit
extension  MainScreen: MainScreenViewProtocol{
    func showPlacehoder(status: Bool, message: String) {
        let placeholder = CustomPlaceholder()
         placeholder.placeholderLabel.text = message
     
        if status{
            mainScreenCollectionView.backgroundView =  placeholder
        }else {
            mainScreenCollectionView.backgroundView = nil
        }
    }
    
    func show(_ Message: String) {
      
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async { [weak self ] in
            guard let self = self else {return}
            self.mainScreenCollectionView.reloadData()
        }
    }
    
    
}
