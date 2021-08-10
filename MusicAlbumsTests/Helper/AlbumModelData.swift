//
//  AlbumModelTest.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 31/07/2021.
//

import Foundation
@testable import MusicAlbums



extension AlbumModel {
    static func createAlbum() -> AlbumModel{
        let artist = ArtistClass(name:"Armin van Buuren", mbid: "477b8c0c-c5fc-4ad2-b5b2-191f0bf2a9df", url: "https://www.last.fm/music/Armin+van+Buuren")
        
        let image = Image(text: "https://lastfm.freetls.fastly.net/i/u/34s/57f8e28f8b184651c6f2ed323c13f858.png", size: Size(rawValue: "small")!)
     let albums = Album(name: "Imagine", playcount: 2797301, mbid: "56a006b0-e615-314b-9b45-86455f0d757b", url: "https://www.last.fm/music/Armin+van+Buuren/Imagine", artist: artist , image: [image,image,image,image])
        
        let topAlbums  = Topalbums(album: [albums,albums,albums], attr: Attrs(artist: "Armin van Buuren", page: "1", perPage: "1", totalPages: "31", total: "see"))
        
        let model = AlbumModel(topalbums: topAlbums)
        
        
       return model
        
    }
}


