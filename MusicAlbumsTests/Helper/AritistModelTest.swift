//
//  AritistModel.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 29/07/2021.
//

import Foundation
@testable import MusicAlbums
struct AritistModelTest: Codable, Equatable{
    let name, listeners, mbid: String
}

extension ArtistModel{
 
    
    static func createAritist() -> ArtistModel{
        let artistmatches = Artistmatches(artist: [Artist(name: "Amorphis", listeners: "466620", mbid: "efaefde1-e09b-4d49-9d8e-b1304d2ece8d", url: "https://www.last.fm/music/Amorphis", streamable: "0", image: [Image(text: "https://lastfm.freetls.fastly.net/i/u/64s/2a96cbd8b46e442fc41c2b86b821562f.png", size: Size(rawValue: "small")!)]),Artist(name: "Amorphis", listeners: "466620", mbid: "efaefde1-e09b-4d49-9d8e-b1304d2ece8d", url: "https://www.last.fm/music/Amorphis", streamable: "0", image: [Image(text: "", size: Size(rawValue: "small")!)]),Artist(name: "Amorphis", listeners: "466620", mbid: "efaefde1-e09b-4d49-9d8e-b1304d2ece8d", url: "https://www.last.fm/music/Amorphis", streamable: "0", image: [Image(text: "", size: Size(rawValue: "small")!)])])
        let model = ArtistModel(results: Results(opensearchQuery: OpensearchQuery(text: "", role: "request", searchTerms: "amr", startPage: "1"), opensearchTotalResults: "15567", opensearchStartIndex: "0", opensearchItemsPerPage: "30", artistmatches: artistmatches , attr: Attr(attrFor: "amr")))
    
        return model
    }
    
    
    
    
}
