//
//  MainScreenViewControllerTest.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 04/08/2021.
//

import XCTest
@testable import MusicAlbums
class MainScreenViewControllerTest: XCTestCase {

    // MARK: - Properities
    var sut: MainScreen!
    //MARK:- Set up
    override func setUp() {
        sut =  MainScreen()
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    //MARK:- Tests
    func test_MainScreen_CanInstantiateAlbums_ViewController (){
        XCTAssertNotNil(sut)
    }
    
    
    func test_MainScreen_WhenCollectionViewLoad_shouldBeNotNill (){
        XCTAssertNotNil(sut.mainScreenCollectionView)
    }
    
    func test_MainScreen_ShouldSetCollectionViewDelegate(){
        XCTAssertNotNil(sut.mainScreenCollectionView.delegate)
    }
    
    func test_MainScreen_ShouldSetCollectionViewDataSource(){
        XCTAssertNotNil(sut.mainScreenCollectionView.dataSource)
    }
    
    func test_MainScreen_ShouldToConformsToCollectionViewDataSource(){
        XCTAssert(sut.conforms(to: UICollectionViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.collectionView(_:numberOfItemsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.collectionView(_:cellForItemAt:))))
    }
    
    func test_MainScreen_ShouldToConformsToCollectionViewDelegate(){
        XCTAssert(sut.conforms(to: UICollectionViewDelegate.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.collectionView(_:didSelectItemAt:))))
      
    }
    
    
    
}

