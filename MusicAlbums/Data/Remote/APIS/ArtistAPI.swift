//
//  ArtistAPI.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import Alamofire
enum ArtistRequest: UrlRequestBuilder{
    case getArtistSearched(_ artist:String , _ page: Int)
    var path: String {
        switch self {
        case .getArtistSearched:
            return ""
        }
    }
    var method: HTTPMethod {
        switch self {
        case . getArtistSearched:
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
        }
    }
}
