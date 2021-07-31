//
//  AlbumsInteractorSpy.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 31/07/2021.
//

import Foundation
@testable import MusicAlbums
class AlbumsInteractorSpy: AlbumsInteractorProtocol {
    var resultToBeReturned:  Result<AlbumModel?, BaseError>!
    func getSearchedArtist(artistId: String, page: Int, responseHandler: @escaping CallResponse<AlbumModel>) {
        responseHandler(resultToBeReturned)
    }
    
    
}
