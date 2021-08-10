//
//  AlbumInfoModelTest.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 02/08/2021.
//

import XCTest
@testable import MusicAlbums
class AlbumInfoModelTest: XCTestCase {
    
    var sut:AlbumInfo?
    
    func test_AlbumInfoModels_ShouldDecodeModel(){
        decodingData(object: AlbumInfo.self, fileResourece: "AlbumDetailsData") { respones in
            //When
            switch respones{
            case .success(let data):
                self.sut =  data
            case .failure(_):
                break
            }
        }
        // Then
        XCTAssertEqual(sut?.album?.name, "Imagine")
    }
}
