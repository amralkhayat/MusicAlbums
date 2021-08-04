//
//  MainScreenInteractorSpy.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 04/08/2021.
//

import Foundation
@testable import MusicAlbums
class MainScreenInteractorSpy: MainScreenInteractorProtocol{
    
    var resultToBeReturned:  Result<[AlbumData]?, RuntimeError>!
    func readObject(responseHandler: @escaping CallResponse<[AlbumData]>) {
        responseHandler(resultToBeReturned)
    }
    
    
}
