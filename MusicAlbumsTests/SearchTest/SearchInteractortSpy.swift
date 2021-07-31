//
//  SearchInteractortTest.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 30/07/2021.
//

import Foundation
@testable import MusicAlbums
class SearchInteractorySpy: SearchInteractorProtocol {
    var resultToBeReturned:  Result<ArtistModel?, BaseError>!
    func getSearchedArtist(artistName: String, page: Int, responseHandler: @escaping CallResponse<ArtistModel>) {
        responseHandler(resultToBeReturned)
       
    }
    
    
}
