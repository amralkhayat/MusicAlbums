//
//  LocalAlbumCellSpy.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 04/08/2021.
//

import Foundation
@testable import MusicAlbums
class LocalAbumCellSpy: LocalAlbumCellView{
    var artistName = ""
    var playAccount = ""
    func displayCellBody(album: AlbumData) {
        artistName = album.artist ?? ""
        playAccount = album.playcount ?? ""
    }
    
    
}
