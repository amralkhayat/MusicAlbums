//
//  AlbumDetailsCellSpy.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 01/08/2021.
//

import Foundation
@testable import MusicAlbums
class AlbumDetailsCellSpy: HeaderCellView {
    func displayCellBody(albumDetails: AlbumInfo) {
        
    }
    
    var albumName = ""
    var playAccount = 0
     var artistName = ""
     var albumImageUrl = ""
     var albumId = ""
    func displayCellBody(albumDetails: AlbumDetailsModel) {
        self.albumName =  albumDetails.albumName ?? ""
        self.playAccount = albumDetails.playAccount
        self.artistName = albumDetails.artistName ?? ""
        self.albumImageUrl = albumDetails.albumImageUrl ?? ""
        self.albumId = albumDetails.albumId
    }
    
  
    
    
    
}
