//
//  AlbumDetailsModelTest.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 01/08/2021.
//

import Foundation
@testable import MusicAlbums

extension AlbumDetailsModel {
  
    static func createAlbumDetails () -> AlbumDetailsModel {
     return  AlbumDetailsModel(albumName: "Imagine", playAccount: 2797373, artistName: "Armin van Buuren",
                         albumImageUrl: "https://lastfm.freetls.fastly.net/i/u/300x300/57f8e28f8b184651c6f2ed323c13f858.png", albumId: "56a006b0-e615-314b-9b45-86455f0d757b")
    }
}
