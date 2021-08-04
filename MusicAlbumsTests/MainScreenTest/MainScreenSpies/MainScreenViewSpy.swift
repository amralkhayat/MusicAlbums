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
    var showMessage = ""
 
    func showPlacehoder(status: Bool, message: String) {
        self.message =  message
        self.status =  true
    }
    
    func show(_ Message: String) {
        showMessage = Message
    }
    
    func reloadCollectionView() {
       isReloadCollectionView = true
    }
    
    
}
