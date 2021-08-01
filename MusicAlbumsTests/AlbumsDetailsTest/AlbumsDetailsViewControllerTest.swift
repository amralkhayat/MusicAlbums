//
//  AlbumsDetailsViewControllerTest.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 31/07/2021.
//

import XCTest
@testable import MusicAlbums
class AlbumsDetailsViewControllerTest: XCTestCase {

    // MARK: - Properities
    var sut: AlbumDetails!
    //MARK:- Set up
    override func setUp() {
        sut =  AlbumDetails()
        sut.loadViewIfNeeded()
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
   
    //MARK:- Tests
    func test_AlbumsDetails_CanInstantiateAlbumsDetails_ViewController (){
        XCTAssertNotNil(sut)
    }
    
    
    func test_AlbumsDetails_WhenTableViewViewLoad_shouldBeNotNill (){
        XCTAssertNotNil(sut.albumDetailsTableView)
    }
    
    func test_AlbumsDetails_ShouldSetTableViewDelegate(){
        XCTAssertNotNil(sut.albumDetailsTableView.delegate)
    }
    
    func test_AlbumDetails_ShouldSetTableViewDataSource(){
        XCTAssertNotNil(sut.albumDetailsTableView.dataSource)
    }
    
    func test_AlbumsDetails_ShouldToConformsToTableViewDataSource(){
        XCTAssert(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
    }

    func test_AlbumsDetails_ShouldToConformsToTableViewDelegate(){
        XCTAssert(sut.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:viewForHeaderInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:heightForHeaderInSection:))))
    }

}
