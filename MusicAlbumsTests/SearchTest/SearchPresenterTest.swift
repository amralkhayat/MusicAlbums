//
//  SearchPresenterTest.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 30/07/2021.
//

import XCTest
@testable import MusicAlbums
class SearchPresenterTest: XCTestCase {
    
    // MARK: - Properities
    var sut:SearchVCPresenter!
    var router = SearchRouterSpy()
    var view = SarchViewSpy()
    var  Interactor = SearchInteractorySpy()
   
    //MARK:- Set up
    override func setUp() {
      sut = SearchVCPresenter(view: view, interactor: Interactor, router: router)
    }
    
    override func tearDown() {
      sut = nil
        super.tearDown()
    }
    
    //MARK:- Tests
    //MARK:- Search Tests
    func test_SearchPresenter_WhenLoadView_ShouldShowCustomPlaceholder(){
        // Given
        let expected =  true
        let expectedMessage = "Search for Artist you Love ❤️"
        //When
        sut.viewDidLoad()
        // Then
        // Then
        XCTAssertEqual(view.placeholderCalled, expected,"Should Return true")
        XCTAssertEqual(view.placeHolderMessage, expectedMessage ,"Message not match" )
    }
    
    func test_SearchPresenter_WhenSearchtextFiledIsEmpty_ShouldShowCustomPlaceholder(){
        // Given
        let expected =  true
        let expectedMessage = "Search for Artist you Love ❤️"
        //When
        sut.search(artist: "")
        // Then
        XCTAssertEqual(view.placeholderCalled, expected,"Should Return true")
        XCTAssertEqual(view.placeHolderMessage, expectedMessage ,"Message not match" )
    }
    
    
    func test_SearchPresenter_WhenSearchtextFiledIsNotEmpty_ShouldHideCustomPlaceholder(){
        // Given
        let expected =  false
        let expectedMessage = "Search for Artist you Love ❤️"
        let artistsToBeReturned = ArtistModel.createAritist()
        Interactor.resultToBeReturned = .success(artistsToBeReturned)
        //When
        sut.search(artist: "justinbieber")
        // Then
        XCTAssertEqual(view.placeholderCalled, expected,"Should Return true")
        XCTAssertEqual(view.placeHolderMessage, expectedMessage ,"Message not match" )
    }
    
    func test_SearchPresnter_WhenSearchCalled_Succses_AndArtistNotFound(){
        
     // Given
        let error = BaseError.serverConnection
        Interactor.resultToBeReturned = .failure(error)

        //When
        sut.search(artist: "justinbieber")
        
        // Then
        XCTAssertEqual(error.localizedDescription,view.errorMessage, "Error message doesn't match")

    }
    

    func test_SearchPresnter_WhenSearchCalled_Failure_displayArtistRetrievalError(){
        
     // Given
        let error = BaseError.serverConnection
        Interactor.resultToBeReturned = .failure(error)

        //When
        sut.search(artist: "justinbieber")
        
        // Then
        XCTAssertEqual(error.localizedDescription,view.errorMessage, "Error message doesn't match")

    }


    //MARK:- TablView Methods Test
    func test_SearchPresnter_WhenSearchCalled_Succses_NumberofArtists(){
        
        // Given
          let expectedAritists = 3
          let artistsToBeReturned = ArtistModel.createAritist()
           Interactor.resultToBeReturned = .success(artistsToBeReturned)
        //When
        sut.search(artist: "justinbieber")
        
        // Then
        XCTAssertEqual(expectedAritists, sut.numberOfRows, "Number of Artist mismatch")

    }
    
    func test_SearchPresnter_WhenConfigureCell_has_release_data(){
        // Given
        let artistCellSpy = ArtistCellSpy()
        sut.artists =  ArtistModel.createAritist().results.artistmatches.artist
        let expectedName = "Amorphis"
        let expectedImageUrl = "https://lastfm.freetls.fastly.net/i/u/64s/2a96cbd8b46e442fc41c2b86b821562f.png"
        //When
        sut.configurationArtistCell(cell: artistCellSpy, index: 0)
        // Then
        XCTAssertEqual(expectedName, artistCellSpy.artistName, "Name of Artist mismatch")
        XCTAssertEqual(expectedImageUrl, artistCellSpy.imageUrl, "Number of Artist mismatch")

    }
    
    func test_SearchPresnter_WhenDidSelect_ShouldNavigateToAlbums(){
        //Given
        let rowToSelect = 1
        let expected = true
        sut.artists =  ArtistModel.createAritist().results.artistmatches.artist
        //When
        sut.didselectCell(index: rowToSelect)
        // Then
        XCTAssertEqual(expected, router.isNavigateCalled)
    }
}
