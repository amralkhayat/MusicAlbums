//
//  AlbumsModelTest.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 05/08/2021.
//

import XCTest
@testable import MusicAlbums
class AlbumsModelTest: XCTestCase {
    var sut:AlbumModel?
   func test_AlbumModel_ShouldDecodeModel(){
    
      // Given
    decodingData(object: AlbumModel.self, fileResourece:"AlbumsData") { respones in
        switch respones{
        case .success(let data):
            self.sut =  data
        case .failure(_):
            break
        }
    }
      //When

        
    XCTAssertEqual(sut?.topalbums.attr?.artist, "Kamal Ahmed feat Noor Jehan")
    }

}
