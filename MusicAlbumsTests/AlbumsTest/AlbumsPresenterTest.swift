//
//  AlbumsPresenterTest.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 31/07/2021.
//

import XCTest
@testable import MusicAlbums
class AlbumsPresenterTest: XCTestCase {

    // MARK: - Properities
    var sut:AlbumsVCPresenter!
    var router = AlbumsRouterSpy()
    var view = AlbumsViewSpy()
    var interactor = AlbumsInteractorSpy()
    let id = "477b8c0c-c5fc-4ad2-b5b2-191f0bf2a9df"
   
    //MARK:- Set up
    override func setUp() {
      sut = AlbumsVCPresenter(view: view , interactor: interactor, router: router, artistId: id)
    }
    
    override func tearDown() {
       sut = nil
        super.tearDown()
    }
    
    //MARK:- Tests
    
    func test_AlbumsPresnter_WhenViewDidLoad_ShouldShowIndecator(){
       // given
        let expected =  true
        let error = BaseError.serverConnection
        interactor.resultToBeReturned = .failure(error)
       //When
        sut.viewDidLoad()
        //Then
        XCTAssertEqual(expected, view.showIndecatorIsCalled)
    }
    
    func test_AlbumsPresnter_WhenViewDidLoad_Failure_HideIndecator_displayArtistRetrievalError(){
        
//     // Given
        let expected =  true
        let error = BaseError.serverConnection
        interactor.resultToBeReturned = .failure(error)

        //When
        sut.viewDidLoad()

        // Then
        XCTAssertEqual(error.localizedDescription,view.errorMessage, "Error message doesn't match")
        XCTAssertEqual(expected, view.hideIndecatorIsCalled)

    }
    
  
    func test_AlbumsPresnter_WhenViewDidLoad_Success_HideIndecator_ReloadTableView(){
        
//     // Given
        let expected =  true
        let albumModel =  AlbumModel.createAlbum()
        interactor.resultToBeReturned = .success(albumModel)

        //When
        sut.viewDidLoad()

        // Then
        XCTAssertEqual(expected,view.reloadTableView)
        XCTAssertEqual(expected, view.hideIndecatorIsCalled)

    }
    
   //MARK:- Table view methods test
    func test_AlbumPresnter_WhenViewDidLoad_Succses_NumberoAlbums(){
        // Given
          let expectedAritists = 3
        let albumsToBeReturned = AlbumModel.createAlbum()
           interactor.resultToBeReturned = .success(albumsToBeReturned)
        //When
        sut.viewDidLoad()
        // Then
        XCTAssertEqual(expectedAritists, sut.numberOfrow, "Number of Albums mismatch")

    }
    
    func test_AlbumPresnter_WhenViewDidLoad_Succses_has_release_data(){
       // Given
        let albumCellSpy = AlbumsCellSpy()
        sut.album = AlbumModel.createAlbum().topalbums.album
        let expectAlbumName = "Imagine"
        let expectedartistName = "Armin van Buuren"
        let expectedimageUr = "https://lastfm.freetls.fastly.net/i/u/34s/57f8e28f8b184651c6f2ed323c13f858.png"
        //When
        sut.configurationArtistCell(cell: albumCellSpy, index: 0)
        
        //Then
        XCTAssertEqual(expectAlbumName ,  albumCellSpy.albumName, "Name of Album mismatch")
        XCTAssertEqual(expectedartistName ,  albumCellSpy.artistName ,"Name of Artist mismatch")
        XCTAssertEqual(expectedimageUr ,  albumCellSpy.albumUrlImage, "Name of Album url mismatch")
    }
    
    
    func test_AlbumPresnter_WhenDidSelect_ShouldNavigateToAlbumDetails(){
        //Given
        let itemToSelect = 0
        let expected = true
        sut.album = AlbumModel.createAlbum().topalbums.album
        //When
        sut.didSelect(item: itemToSelect)
        // Then
        XCTAssertEqual(expected, router.isRouteToAlbumsDetailsCalled)
    }
}
