//
//  ArtistModelTest.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 05/08/2021.
//

import XCTest
@testable import MusicAlbums
class ArtistModelTest: XCTestCase {

    var sut:ArtistModel?
   func test_ArtistModel_ShouldDecodeModel(){
    
      // Given
    decodingData(object: ArtistModel.self, fileResourece:"ArtistData") { respones in
        switch respones{
        case .success(let data):
            self.sut =  data
        case .failure(_):
            break
        }
    }
      //When
    XCTAssertEqual(sut?.results.artistmatches.artist[0].name, "Amy Winehouse")
    }

}


