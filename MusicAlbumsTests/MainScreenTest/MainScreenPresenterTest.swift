//
//  MainScreenPresenterTest.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 04/08/2021.
//

import XCTest
@testable import MusicAlbums
class MainScreenPresenterTest: XCTestCase {
    // MARK: - Properities
    var sut:MainScreenVCPresenter!
    var router = MainScreenRouterSpy()
    var view = MainScreenViewSpy()
    var  Interactor = MainScreenInteractorSpy()
   
    //MARK:- Set up
    override func setUp() {
      sut = MainScreenVCPresenter(view: view, interactor: Interactor, router: router)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_MainScreenPresnter_WhenViewCheckDataIsEmpty_ShouldShowMessage(){
       // Given
         let expectedmessage = "Empty Albums🤭"
         let expectedStatus = true
        sut.albumsData = [AlbumData]()
          // When
        sut.checkDataIsEmpty()
         // Then
        XCTAssertEqual(view.message, expectedmessage)
        XCTAssertEqual(view.status,  expectedStatus )
    }

// MARK:- READ
    func test_MainScreenPresnter_WhenViewDidLoad_readObjects_Succes_ShouldReloadCollection(){
       // Given
  
         let expectedStatus = true
        let data = AlbumInfo.createAlbumDetails()
        Interactor.resultToBeReturned = .success([data])
          // When
        sut.viewDidLoad()
         // Then
        XCTAssertEqual(view.isReloadCollectionView , expectedStatus )
    }

    func test_MainScreenPresnter_WhenViewDidLoad_readObjects_Failure_ShouldReloadCollection(){
       // Given
        let expectedError = RuntimeError.NoRealmSet("Data can not retrieve")
        Interactor.resultToBeReturned = .failure(expectedError)
          // When
        sut.viewDidLoad()
         // Then
        XCTAssertEqual(view.showMessage, expectedError.localizedDescription )
    }
    
    //MARK: TableView Test Methods
    
    func test_MainScreenPresnter_WhenViewDidLoad_Succses_NumberofAlbums(){
        // Given
          let expectedAlbums = 1
        let data = AlbumInfo.createAlbumDetails()
        Interactor.resultToBeReturned = .success([data])
        //When
        sut.viewDidLoad()
        
        // Then
        XCTAssertEqual(expectedAlbums, sut.numberOfItems, "Number of Albums mismatch")

    }
    
    func test_MainScreenPresnter_WhenConfigureCell_ShouldPresentdata(){
        // Given
        let localAlbumCellSpy = LocalAbumCellSpy()
        sut.albumsData.append(AlbumInfo.createAlbumDetails())
        let expectedName = "Armin van Buuren"
        let expectedPlayAccount = "2797470"
        //When
        sut.configurationAlbumCell(cell:localAlbumCellSpy, index: 0)
        // Then
        XCTAssertEqual(expectedName, localAlbumCellSpy.artistName, "Name of Artist mismatch")
        XCTAssertEqual(expectedPlayAccount, localAlbumCellSpy.playAccount, "Name of PlayAccount mismatch")

    }
    
    func test_MainScreenPresnter_WhenDidSelect_ShouldNavigateToAlbumDetails(){
        //Given
        let itemToSelect = 0
        let expected = true
        sut.albumsData.append(AlbumInfo.createAlbumDetails())
        //When
        sut.didSelect(item: itemToSelect)
        // Then
        XCTAssertEqual(expected, router.isRouteToAlbumsDetailsCalled)
    }
    
}
