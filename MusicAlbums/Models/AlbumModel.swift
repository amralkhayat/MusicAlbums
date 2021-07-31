//
//  AlbumModel.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 31/07/2021.
//

import Foundation
import Foundation

// MARK: - AlbumModel
struct AlbumModel: Codable {
    let topalbums: Topalbums
}

// MARK: - Topalbums
struct Topalbums: Codable {
    let album: [Album]
    let attr: Attr

    enum CodingKeys: String, CodingKey {
        case album
        case attr = "@attr"
    }
}

// MARK: - Album
struct Album: Codable {
    let name: String
    let playcount: Int
    let mbid: String?
    let url: String
    let artist: ArtistClass
    let image: [Image]
}

// MARK: - ArtistClass
struct ArtistClass: Codable {
    let name: ArtistEnum
    let mbid: String
    let url: String
}

enum ArtistEnum: String, Codable {
    case arminVanBuuren = "Armin van Buuren"
}

