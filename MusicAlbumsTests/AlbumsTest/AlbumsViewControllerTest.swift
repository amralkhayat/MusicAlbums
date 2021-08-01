//
//  AlbumsViewControllerTest.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 31/07/2021.
//

import XCTest
@testable import MusicAlbums
class AlbumsViewControllerTest: XCTestCase {
    // MARK: - Properities
    var sut: Albums!
    //MARK:- Set up
    override func setUp() {
        sut =  Albums()
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    //MARK:- Tests
    func test_Albums_CanInstantiateAlbums_ViewController (){
        XCTAssertNotNil(sut)
    }
    
    
    func test_Albums_WhenCollectionViewLoad_shouldBeNotNill (){
        XCTAssertNotNil(sut.albumsCollectionView)
    }
    
    func test_Albums_ShouldSetCollectionViewDelegate(){
        XCTAssertNotNil(sut.albumsCollectionView.delegate)
    }
    
    func test_Album_ShouldSetCollectionViewDataSource(){
        XCTAssertNotNil(sut.albumsCollectionView.dataSource)
    }
    
    func test_Albums_ShouldToConformsToCollectionViewDataSource(){
        XCTAssert(sut.conforms(to: UICollectionViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.collectionView(_:numberOfItemsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.collectionView(_:cellForItemAt:))))
    }
    
    func test_Albums_ShouldToConformsToCollectionViewDelegate(){
        XCTAssert(sut.conforms(to: UICollectionViewDelegate.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.collectionView(_:didSelectItemAt:))))
      
    }
    
    
    
}
