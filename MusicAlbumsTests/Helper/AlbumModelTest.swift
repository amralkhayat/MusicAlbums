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
        let artist = ArtistClass(name: ArtistEnum(rawValue: "Armin van Buuren")!, mbid: "477b8c0c-c5fc-4ad2-b5b2-191f0bf2a9df", url: "https://www.last.fm/music/Armin+van+Buuren")
        let images = Image(text: "https://lastfm.freetls.fastly.net/i/u/34s/57f8e28f8b184651c6f2ed323c13f858.png", size: Size(rawValue: "small")!)
     let albums = Album(name: "Imagine", playcount: 2797301, mbid: "56a006b0-e615-314b-9b45-86455f0d757b", url: "https://www.last.fm/music/Armin+van+Buuren/Imagine", artist: artist , image: [images])
        
     let topAlbums  = Topalbums(album: [albums,albums,albums], attr: Attr(attrFor:"Armin van Buuren"))
     let model = AlbumModel(topalbums: topAlbums )
        
        
       return model
        
    }
}


