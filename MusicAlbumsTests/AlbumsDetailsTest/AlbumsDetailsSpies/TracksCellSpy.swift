//
//  TracksCellSpy.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 05/08/2021.
//

import Foundation
@testable import MusicAlbums

class TracksCellSpy: TracksCellView {
        var trackName = ""
    func displayCellBody(tracks: Track) {
        trackName = tracks.name ?? ""
    }
    
    
}
