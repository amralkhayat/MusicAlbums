//
//  AlnumsDetailsPresenterTest.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 01/08/2021.
//

import XCTest
@testable import MusicAlbums
class AlnumsDetailsPresenterTest: XCTestCase {

    // MARK: - Properities
    var sut: AlbumDetailsVcPresnter!
    let router = AlbumsDetailsRouterrSpy()
    let interactor = AlbumsDetailsInteractorSpy()
    let view = AlbumsDetailsViewSpy()
    //MARK:- Set up
    override func setUp() {
        sut = AlbumDetailsVcPresnter(view: view, interactor: interactor , router: router, albumDetailsModel: AlbumDetailsModel.createAlbumDetails())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
   
    //MARK:- Tests
    func test_AlbumDetailsPresnter_WhenLoad_Should_has_release_data(){
       // Given
        let albumDetailsCellSpy = AlbumDetailsCellSpy()
        sut.albumDetails =  AlbumDetailsModel.createAlbumDetails()
        let expectedAlbumName = "Imagine"
        let expectePlayAccount = 2797373
         let expecteArtistName = "Armin van Buuren"
         let expecteAlbumImageUrl = "https://lastfm.freetls.fastly.net/i/u/300x300/57f8e28f8b184651c6f2ed323c13f858.png"
         let  expecteAlbumId = "56a006b0-e615-314b-9b45-86455f0d757b"
        //When
        sut.configurationAlbumDetailsCell(cell: albumDetailsCellSpy)

        //Then
        XCTAssertEqual(expectedAlbumName ,  albumDetailsCellSpy.albumName, "albumName mismatch")
        XCTAssertEqual(expectePlayAccount ,  albumDetailsCellSpy.playAccount, "playAccount mismatch")
        XCTAssertEqual(expecteArtistName ,  albumDetailsCellSpy.artistName, "artistName mismatch")
        XCTAssertEqual(expecteAlbumImageUrl ,  albumDetailsCellSpy.albumImageUrl, "albumImageUrl  mismatch")
        XCTAssertEqual(expecteAlbumId ,  albumDetailsCellSpy.albumId, "albumId mismatch")
      
    }
    
    

}
