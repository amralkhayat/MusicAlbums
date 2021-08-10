//
//  AlbumsInteractorSpy.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 01/08/2021.
//

import Foundation
@testable import MusicAlbums

class AlbumsDetailsInteractorSpy: AlbumDetailsInteractorProtocol {
    var resultToBeReturned:  Result<String?, RuntimeError>!
    var resultToBeReturnedRemote:  Result<AlbumInfo?, BaseError>!
    var resultReadReturend:Result<AlbumData?,RuntimeError>!
    var isalbumExist = false
    func saveObject(album: AlbumData, responseHandler: @escaping CallResponse<String>) {
        responseHandler(resultToBeReturned)
    }
    
    func deleteObject(album: AlbumData, responseHandler: @escaping CallResponse<String>) {
        responseHandler(resultToBeReturned)
    }
    
    func readObject(primaryKey: String, responseHandler: @escaping CallResponse<AlbumData>) {
        responseHandler(resultReadReturend)
    }
    

    func getAlbumInfo(artistName: String, albumName albumId: String, responseHandler: @escaping CallResponseRemote<AlbumInfo>) {
       responseHandler(resultToBeReturnedRemote)
    }
    
    func AlbumExists(primaryKey: String) -> Bool {

        return isalbumExist
    }
    
    

}
