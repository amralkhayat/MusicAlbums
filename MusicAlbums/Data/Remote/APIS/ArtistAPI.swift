//
//  ArtistAPI.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import Alamofire
enum ArtistRequest: UrlRequestBuilder{
    case getArtistSearched(_ artist:String , _ page: Int)
    case getAlbums(_ artistId:String , _ page: Int)
    var path: String {
        switch self {
        case .getArtistSearched:
            return ""
        case .getAlbums:
            return ""
        }
    }
    var method: HTTPMethod {
        switch self {
        case . getArtistSearched,.getAlbums:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getArtistSearched(let artist , let page):
            return ["method": "artist.search",
                    "artist": artist,
                    "api_key": "559a4f1117f89ea9a53e97504b0729ae",
                    "page": page,
                    "format": "json"]
        case .getAlbums(let artistId , let page):
             return ["method": "artist.gettopalbums",
                      "mbid": artistId,
                      "api_key": "559a4f1117f89ea9a53e97504b0729ae",
                     "page": page,
                     "format": "json"]
        }
    }
}
