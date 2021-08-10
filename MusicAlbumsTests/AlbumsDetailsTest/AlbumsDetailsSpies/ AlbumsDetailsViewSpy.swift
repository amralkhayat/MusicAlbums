//
//   AlbumsDetailsViewSpy.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 01/08/2021.
//

import Foundation
@testable import MusicAlbums

class AlbumsDetailsViewSpy: AlbumDetailsViewProtocol {
 
    var isShowIndicator = false
    var isHideIndicator = false
    var isTableViewCalled = false
    var message = ""
    var deleteMessage = ""
    var albumImageUrl = ""
    func showIndecator() {
       isShowIndicator = true
    }
    
    func hideIndecator() {
        isHideIndicator = true
    }
    
    func show(_ Message: String) {
        message = Message
    }
    
    func reloadTableView() {
        isTableViewCalled = true
    }
    
    func showAlbumImage(url: String) {
        albumImageUrl = url
    }
    
    func deleteObject(_ Message: String) {
        deleteMessage = Message
    
}

}
