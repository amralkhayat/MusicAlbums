//
//  AlbumDetailsModelTest.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 01/08/2021.
//

import Foundation
import RealmSwift
@testable import MusicAlbums

extension AlbumDetailsModel {
  
    static func createAlbumDetails () -> AlbumDetailsModel {
     return  AlbumDetailsModel(albumName: "Imagine", playAccount: 2797373, artistName: "Armin van Buuren",
                         albumImageUrl: "https://lastfm.freetls.fastly.net/i/u/300x300/57f8e28f8b184651c6f2ed323c13f858.png", albumId: "56a006b0-e615-314b-9b45-86455f0d757b")
    }
}


extension AlbumInfo {
    static func createAlbumDetails () -> AlbumInfo {
        let artistInfo = ArtistInfo(mbid:  "477b8c0c-c5fc-4ad2-b5b2-191f0bf2a9df")
        let track =  Track(artist: artistInfo, duration:  567, name: "Imagine")
        let list = List<Track>()
        list.append(track)
        let tr = Tracks()
        tr.track =  list
      
    
        let image = AlbumImage(size: "small", text: "shttps://lastfm.freetls.fastly.net/i/u/34s/57f8e28f8b184651c6f2ed323c13f858.jpg")
        let  imageList = List<AlbumImage>()
        imageList.append(image)
        imageList.append(image)
        imageList.append(image)
        imageList.append(image)
        imageList.append(image)
        imageList.append(image)
        
        let albumData = AlbumData(artist: "Armin van Buuren", playcount: "2797470", listeners: "152233", name: "Imagine", tracks: tr, image: imageList )
        return AlbumInfo(album: albumData)
        
        
        
        
        
        
        
    }
}
