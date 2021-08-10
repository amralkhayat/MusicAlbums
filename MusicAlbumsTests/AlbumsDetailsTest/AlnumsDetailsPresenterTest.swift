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
        sut = AlbumDetailsVcPresnter(view: view, interactor: interactor , router: router, albumConfiguration: AlbumConfiguratinModel.albumConfiguratinModel())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
   
//    MARK:- Tests
//      MARK:- CREATE
    func test_AlbumDetailsPresnter_WhenWriteObject_Should_SaveDataToLoaclStorage_showMessageSucces_HideIndicator(){
       // Given
         let message = "Data successfully saved"
        interactor.resultToBeReturned = .success(message)
        let expected = true
        let data = AlbumInfo.createAlbumDetails()
          // When
        sut.writeObject(album:data)
         // Then
        XCTAssertEqual(view.isShowIndicator, expected)
        XCTAssertEqual(view.isHideIndicator, expected)
        XCTAssertEqual(view.message, message)
    }

    func test_AlbumDetailsPresnter_WhenWriteObject_ShouldNot_SaveDataToLoaclStorage_showMessageFailure_HideIndicator(){
       // Given
        let errorMessage = RuntimeError.NoRealmSet("Data Could not Successfully saved ")
        interactor.resultToBeReturned = .failure(errorMessage)
        let expected = true
        let data = AlbumInfo.createAlbumDetails()
          // When
        sut.writeObject(album:data)
         // Then

        XCTAssertEqual(view.isHideIndicator, expected)
        XCTAssertEqual(view.message, errorMessage.localizedDescription)
    }

    func test_AlbumDetailsPresnter_WhenWriteObjectWithEmptyObject_ShouldNot_SaveDataToLoaclStorage_showMessageFailure_HideIndicator(){
       // Given
        let errorMessage = RuntimeError.NoRealmSet("Could not save data becuse object is Empty ")
        interactor.resultToBeReturned = .failure(errorMessage)
        let expected = true
        let data = AlbumData()
          // When
        sut.writeObject(album:data)
         // Then

        XCTAssertEqual(view.isHideIndicator, expected)
        XCTAssertEqual(view.message, errorMessage.localizedDescription)
    }



    //MARK:- DELETE
    func test_AlbumDetailsPresnter_WhenDeleteObject_Should_DeleteFromLoaclStorage_showMessageSucces_HideIndicator(){
       // Given
         let message = "Data successfully Deleted"
        interactor.resultToBeReturned = .success(message)
        let expected = true
        let data = AlbumInfo.createAlbumDetails()
          // When
        sut.writeObject(album:data)
        sut.deleteObject(album: data)
         // Then
        XCTAssertEqual(view.isShowIndicator, expected)
        XCTAssertEqual(view.isHideIndicator, expected)
        XCTAssertEqual(view.deleteMessage, message)
    }

    func test_AlbumDetailsPresnter_WhenDeleteObject_ShouldNot_DeleteFromLoaclStorage_showMessageSucces_HideIndicator(){
       // Given
        let errorMessage = RuntimeError.NoRealmSet("Data Could not Successfully Deleted")
        interactor.resultToBeReturned = .failure(errorMessage)
        let expected = true
        let data = AlbumInfo.createAlbumDetails()
          // When
        sut.writeObject(album:data)
        sut.deleteObject(album: data)
         // Then
        XCTAssertEqual(view.isHideIndicator, expected)
        XCTAssertEqual(view.message, errorMessage.localizedDescription)
    }


    //MARK:- READ
    func test_AlbumDetailsPresnter_WhenReadObject_ShouldReadDataFromPrimaryKey_HideIndecator_ReloadTableView(){
       // Given
        let expected = true
        let expectedPrimaryKey = "Imagine"
        let data = AlbumInfo.createAlbumDetails()
        interactor.resultReadReturend = .success(data)
        interactor.resultToBeReturned = .success( "Data successfully saved")
          // When
        sut.writeObject(album:data)

        sut.readObject(primaryKey: expectedPrimaryKey)
         // Then
        XCTAssertEqual(view.isHideIndicator, expected)
        XCTAssertEqual(sut.albumInfo?.name,expectedPrimaryKey)
        XCTAssertEqual(sut.albumInfo?.tracks?.track[0].duration, 567)
    }

    func test_AlbumDetailsPresnter_WhenReadObject_ShouldNotReadNoDataSaved_HideIndecator_showErrorMessage(){
       // Given
        let expected = true
        let expectedPrimaryKey = "Imagine"
        let expectedError = RuntimeError.NoRealmSet("Data has been saved")
        interactor.resultReadReturend = .failure(expectedError)
          // When
        sut.readObject(primaryKey: expectedPrimaryKey)
         // Then
        XCTAssertEqual(view.isHideIndicator, expected)
        XCTAssertNotEqual(sut.albumInfo?.name,expectedPrimaryKey)
        XCTAssertEqual(view.message, expectedError.localizedDescription)
    }

  //MARK:- Request Respones
    func test_AlbumInfoPresnter_WhenPopulateAlbumInfoFromApiRequest_ShouldShowIndecator(){
       // given
        let expected =  true
        let error = BaseError.serverConnection
        interactor.resultToBeReturnedRemote = .failure(error)
       //When
        sut.populateAlbumInfoFromApiRequest()
        //Then
        XCTAssertEqual(expected, view.isShowIndicator)
    }


    func test_AlbumsInfoPresnter_WhenPopulateAlbumInfoFromApiReques_Success_HideIndecator_ReloadTableView(){
 //
 //     // Given
         let expected =  true
        let expectedImageUrl = "shttps://lastfm.freetls.fastly.net/i/u/34s/57f8e28f8b184651c6f2ed323c13f858.jpg"
        let albumInfo =  AlbumInfo.createAlbumInfo()
         interactor.resultToBeReturnedRemote = .success(albumInfo)

         //When
        sut.populateAlbumInfoFromApiRequest()

         // Then
         XCTAssertEqual(expected,view.isTableViewCalled)
         XCTAssertEqual(expected, view.isHideIndicator)
        XCTAssertEqual(expectedImageUrl , view.albumImageUrl)

     }


        func test_AlbumsInfoPresnter_WhenPopulateAlbumInfoFromApiReques_Failure_HideIndecator_displayRetrievalError(){

    //     // Given
            let expected =  true
            let error = BaseError.serverConnection
            interactor.resultToBeReturnedRemote = .failure(error)

            //When
            sut.populateAlbumInfoFromApiRequest()

            // Then
            XCTAssertEqual(error.localizedDescription,view.message, "Error message doesn't match")
            XCTAssertEqual(expected, view.isHideIndicator)

        }


    //MARK:- Mulitple load data source

    func test_AlbumsInfoPresnter_populateAlbumInfo_WhenThereisPrimaryKeyLoadDataFromLocal(){
        // Given
         let expected = true
         let expectedPrimaryKey = "Imagine"
         let data = AlbumInfo.createAlbumDetails()
         interactor.resultReadReturend = .success(data)
         interactor.resultToBeReturned = .success( "Data successfully saved")
        interactor.isalbumExist = true
           // When
          sut.writeObject(album:data)
          sut.readObject(primaryKey: expectedPrimaryKey)
          sut.populateAlbumInfo()
          // Then
         XCTAssertEqual(view.isHideIndicator, expected)
         XCTAssertEqual(sut.albumInfo?.name,expectedPrimaryKey)

    }


    func test_AlbumsInfoPresnter_populateAlbumInfo_WhenThereIsNOPrimaryKey_LoadDataServer_showIndicatorOfRequest(){
        // Given
         let expected = true
         let albumInfo =  AlbumInfo.createAlbumInfo()
           // When
          interactor.isalbumExist = false
          interactor.resultToBeReturnedRemote = .success(albumInfo)
          sut.populateAlbumInfo()

          // Then
        XCTAssertEqual(view.isShowIndicator, expected)

    }
    //MARK:- Table view methods test
     func test_AlbumsInfoPresnter_WhenPopulateAlbumInfo_Succses_NumberoTracks(){
         // Given
          let expectedTracks = 1
          let albumInfo =  AlbumInfo.createAlbumInfo()
        interactor.resultToBeReturnedRemote = .success(albumInfo)
         //When
        sut.populateAlbumInfo()
         // Then
         XCTAssertEqual(expectedTracks, sut.numberTracks, "Number of Albums mismatch")

     }
    func test_AlbumsInfoPresnter_WhenPopulateAlbumInfo_Succses_ShowTrackView(){
         // Given
         let tarckCellSpy = TracksCellSpy()
          sut.albumInfo =  AlbumInfo.createAlbumDetails()
         let expectTrackName = "Imagine"
          //When
        sut.configurationTracksCellViewCell(cell: tarckCellSpy, index: 0)
         //Then
        XCTAssertEqual( expectTrackName , tarckCellSpy.trackName, "Name track mismatch")

     }
    func test_AlbumsInfoPresnter_WhenPopulateAlbumInfo_Succses_ShowHeaderView(){
         // Given
         let headrCellSpy = HeaderCellSpy()
          sut.albumInfo =  AlbumInfo.createAlbumDetails()
          let expectedAlbumName = "Imagine"
          let expectedPlayAccount = "2797470"
          let expectedArtistName = "Armin van Buuren"
          let expectedImageUrl = "shttps://lastfm.freetls.fastly.net/i/u/34s/57f8e28f8b184651c6f2ed323c13f858.jpg"
          let expected =  true
          //When
        sut.configurationHeaderCell(cell: headrCellSpy)
         //Then
        XCTAssertEqual( expectedAlbumName , headrCellSpy.albumName, "Album Name mismatch")
        XCTAssertEqual( expectedPlayAccount , headrCellSpy.playAccount, "Play Account mismatch")
        XCTAssertEqual( expectedArtistName ,  headrCellSpy.artistName, "Artist Name mismatch")
        XCTAssertEqual( expectedImageUrl ,  headrCellSpy.albumImageUrl, "Artist Name mismatch")
        XCTAssertEqual( expected ,  headrCellSpy.imageIsdownloaded, "Artist Name mismatch")
     }



}
