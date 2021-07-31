//
//  AlbumModel.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 31/07/2021.
//


import Foundation

// MARK: - AlbumModel
struct AlbumModel: Codable {
    let topalbums: Topalbums
}

// MARK: - Topalbums
struct Topalbums: Codable {
    let album: [Album]
    let attr: Attrs?

    enum CodingKeys: String, CodingKey {
        case album
        case attr = "@attr"
    }
}

// MARK: - Album
struct Album: Codable {
    let name: String?
    let playcount: Int?
    let mbid: String?
    let url: String?
    let artist: ArtistClass
    let image: [Image]
}

// MARK: - ArtistClass
struct ArtistClass: Codable {
    let name: String?
    let mbid: String?
    let url: String?
}

// MARK: - Attrs
struct Attrs: Codable {
    let artist: String
    let page, perPage, totalPages, total: String
}
