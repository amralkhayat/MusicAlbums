//
//  AlbumsInteractorSpy.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 01/08/2021.
//

import Foundation
@testable import MusicAlbums

class AlbumsDetailsInteractorSpy: AlbumDetailsInteractorProtocol {
    func AlbumExists(primaryKey: String) -> Bool {
        true
    }
    
    var resultToBeReturned:  Result<String?, RuntimeError>!
    var resultToBeReturnedRemote:  Result<AlbumInfo?, BaseError>!
    var resultReadReturend:Result<AlbumInfo?, RuntimeError>!
    func saveObject(album: AlbumInfo, responseHandler: @escaping CallResponse<String>) {
        responseHandler(resultToBeReturned)
    }
    
   func deleteObject(album: AlbumInfo, responseHandler: @escaping CallResponse<String>) {
    responseHandler(resultToBeReturned)

   }
    
    func readObject(primaryKey: String, responseHandler: @escaping CallResponse<AlbumInfo>) {
      responseHandler(resultReadReturend)
    }
    
    func getAlbumInfo(artistName: String, albumId: String, responseHandler: @escaping CallResponseRemote<AlbumInfo>) {
       responseHandler(resultToBeReturnedRemote)
    }
    

}
