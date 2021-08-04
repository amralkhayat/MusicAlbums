//
//  MainScreenViewSpy.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 04/08/2021.
//

import Foundation
@testable import MusicAlbums
class MainScreenViewSpy: MainScreenViewProtocol{
    var message = ""
    var status = false
    var isReloadCollectionView = false
 
    func showPlacehoder(status: Bool, message: String) {
        self.message =  message
        self.status =  true
    }

    func reloadCollectionView() {
       isReloadCollectionView = true
    }
    
    
}
