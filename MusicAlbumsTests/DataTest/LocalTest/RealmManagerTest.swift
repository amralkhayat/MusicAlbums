//
//  RealmManagerTest.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 01/08/2021.
//

import XCTest
import RealmSwift

@testable import MusicAlbums
class RealmManagerTest: XCTestCase {
    var sut:RealmManager!
    //MARK:- Set up
    override func setUp()  {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        let realm = try! Realm()
        sut = RealmManager(realm: realm)
    }
    
    override func tearDown() {
       sut = nil
        
        super.tearDown()
    }
    //MARK: - CRUD Tests
    // MARK: Create
//    func test_WhenUseCreateObjectMethod_ShouldSuccessfullySaveObject(){
//    //Given
//        let data =  AlbumDetailsModel.createAlbumDetails()
//        var Albums = [AlbumDetailsModel]()
//        Albums.append(data)
//        //When
//        sut.create(Albums){ resones in
//            //Then
//            switch resones {
//            case .success(let message):
//                XCTAssertEqual(message, "Data successfully saved")
//            case .failure(let error):
//                XCTFail("Request was not successful: \(error.localizedDescription)")
//            }
//        }
//    }
//   
//    
//    func test_WhenUseCreateObjectMethodone_ShouldSuccessfullySaveObject(){
//    //Given
//        let data =  AlbumDetailsModel.createAlbumDetails()
//        let savedAlbum = SavedAlbums()
//        savedAlbum.albums.append(data)
//        //When
//        sut.create(savedAlbum, responseHandler: <#RealmManager.CallResponse<String>#>)
//        let expectedmae = "Armin van Buuren"
//        XCTAssertEqual(expectedmae , savedAlbum.albums[0].artistName)
//      
//    }
//  
//    
//    func test_WhenUseCreateObjectMethodone2_ShouldSuccessfullySaveObject(){
//    //Given
////        let data =  AlbumInfo.createAlbumDetails()
////        let savedAlbum = AlbumInfo()
////        savedAlbum.name = data.name
////     
////        //When
////        sut.create(savedAlbum)
////        print(savedAlbum.name)
////        let expectedmae = "Imagine"
////        XCTAssertEqual(expectedmae , savedAlbum.name)
//      
//    }
//   

}
