//
//  AlbumDetailsModel.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 01/08/2021.
//

import Foundation
import RealmSwift


@objcMembers class AlbumDetailsModel: NSObject{
    dynamic var albumName: String? = nil
    dynamic var playAccount: Int =  0
    dynamic var artistName: String? = nil
    dynamic var albumImageUrl: String? = nil
    dynamic var albumId: String = ""
    
    convenience init(albumName: String?,playAccount: Int ,artistName: String?
                     ,albumImageUrl: String?,albumId: String) {
    
        self.init()
        self.albumName = albumName
        self.playAccount = playAccount
        self.artistName = artistName
        self.albumImageUrl = albumImageUrl
        self.albumId = albumId
        
    }
    
     static func primaryKey() -> String? {
       return "id"
    }
    
}

