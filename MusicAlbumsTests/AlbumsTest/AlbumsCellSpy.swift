//
//  AlbumsCellSpy.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 31/07/2021.
//

import Foundation
@testable import MusicAlbums
class AlbumsCellSpy: AlbumCellView {
    var albumName = ""
    var artistName = ""
    var albumUrlImage = ""

    func displayCellBody(album: Album) {
        albumName = album.name
        artistName = album.artist.name.rawValue
        albumUrlImage =  album.image[0].text
    }
    
    
    
}
