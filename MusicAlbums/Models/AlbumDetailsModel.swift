//
//  AlbumDetailsModel.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 01/08/2021.
//

import Foundation
import RealmSwift


@objcMembers class AlbumDetailsModel: Object{
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
    
    override static func primaryKey() -> String? {
       return "albumId"
    }
    
}

@objcMembers class SavedAlbums: Object{
    dynamic var id: String = ""
    var albums = List<AlbumDetailsModel> ()
    override class func primaryKey() -> String? {
        return "id"
    }
}














@objcMembers class AlbumInfo:Object , Codable {
    dynamic var album:AlbumData?
    dynamic var id = ""

             
    convenience init(album:AlbumData) {
        self.init()
        self.album = album

    }

    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.album = try container.decode( AlbumData.self, forKey: .album)

    }

    override static func primaryKey() -> String? {
        return "id"
    }
}



@objcMembers class AlbumData: Object , Codable{
     dynamic var artist, playcount: String?
     dynamic var listeners: String?
     dynamic var name: String?
      var  image = List<AlbumImage>()
      dynamic  var tracks:Tracks?
     
    
    convenience init(artist: String , playcount: String ,listeners: String, name: String,tracks : Tracks,image : List<AlbumImage>) {
        self.init()
        self.artist = artist
        self.playcount =  playcount
        self.listeners = listeners
        self.name =  name
        self.tracks = tracks
        self.image = image
    }
    
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.artist = try container.decode(String.self, forKey: .artist)
        self.playcount = try container.decode(String.self, forKey: .playcount)
        self.listeners = try container.decode(String.self, forKey: .listeners)
        self.tracks = try container.decode(Tracks.self, forKey: .tracks)
        let image = try container.decodeIfPresent([AlbumImage].self, forKey: .image) ?? [AlbumImage()]
        self.image.append(objectsIn: image)
        self.name = try container.decode(String.self, forKey: .name)
        
    }
    
    private enum CodingKeys: String, CodingKey {
          case artist
          case playcount
          case listeners
          case name
          case tracks
          case image
      }
    
    override class func primaryKey() -> String? {
        return "name"
    }
    
}




// MARK: - Tracks
@objcMembers class Tracks: Object, Codable{
    dynamic var id: String = ""
      var track = List<Track>()
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let trackList = try container.decodeIfPresent([Track].self, forKey: .track ) ?? [Track()]
        self.track.append(objectsIn: trackList)
        
    }
    private enum CodingKeys: String, CodingKey {
         case track
      }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - Track
@objcMembers class Track: Object,Codable {
    dynamic var artist: ArtistInfo?
    dynamic var duration: Int?
    dynamic var name: String?

    convenience  init(artist: ArtistInfo,duration: Int ,name: String) {
        self.init()
        self.artist = artist
        self.duration = duration
        self.name = name
        
    }
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.artist = try container.decode(ArtistInfo.self, forKey: .artist)
        self.duration = try container.decode(Int.self, forKey: .duration)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    enum CodingKeys: String, CodingKey {
        case artist
        case duration,name
    }
    
    override class func primaryKey() -> String? {
        return "name"
    }
}

// MARK: - ArtistInfo
@objcMembers class ArtistInfo: Object,Codable {
    dynamic var mbid: String?
    
    convenience  init(mbid: String) {
        self.init()
        self.mbid = mbid
    }
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.mbid = try container.decode(String.self, forKey: .mbid)
    }
    
    private enum CodingKeys: String, CodingKey {
         case mbid
      }

}

// MARK: - Image
@objcMembers class AlbumImage: Object,Codable {
    dynamic var size: String?
    dynamic var text: String?

    enum CodingKeys: String, CodingKey {
        case size
        case text = "#text"
    }
    
    convenience  init(size: String,text: String) {
        self.init()
        self.size = size
        self.text =  text
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.size = try container.decode(String.self, forKey: .size)
        self.text = try container.decode(String.self, forKey: .text)
    }
    
    override class func primaryKey() -> String? {
        return "text"
    }
}
