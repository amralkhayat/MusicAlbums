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
    
      // Given
    guard let path =  Bundle.main.path(forResource: "data", ofType: "json")
    else {fatalError("Can't find search.json file")}
    
   let url = URL(fileURLWithPath: path)
  //When
  do {
    let jsonData = try Data(contentsOf: url)
    sut =  try JSONDecoder().decode(AlbumInfo.self,from:jsonData)
     } catch{
         print("error")
    }
        
        XCTAssertEqual(sut?.album?.name, "Imagine")
    }
}
