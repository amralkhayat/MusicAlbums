//
//  AlbumDetailsCellSpy.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 01/08/2021.
//

import Foundation
@testable import MusicAlbums
class HeaderCellSpy: HeaderCellView {
    var albumName = ""
    var playAccount = ""
     var artistName = ""
     var albumImageUrl = ""
      var imageIsdownloaded = false
    
    func albumIsDownloaded(status: Bool) {
       imageIsdownloaded = true
    }
    
    func displayCellBody(albumDetails: AlbumData) {
        self.albumName =  albumDetails.name ?? ""
        self.playAccount = albumDetails.playcount ?? ""
        self.artistName = albumDetails.artist ?? ""
        self.albumImageUrl = albumDetails.image[0].text ?? ""
     
    }
    
    
    
}
