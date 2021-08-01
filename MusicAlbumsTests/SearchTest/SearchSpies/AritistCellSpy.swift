//
//  AritistCellSpy.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 30/07/2021.
//


import Foundation
@testable import MusicAlbums
class ArtistCellSpy: ArtistCellView {
    var artistName = ""
    var imageUrl = ""
    func displayCellBody(artist: Artist) {
        artistName = artist.name
        imageUrl = artist.image[0].text
    }
    
    
}
