//
//  APIManagerTest.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 29/07/2021.
//

import XCTest
@testable import MusicAlbums
import Alamofire
class APIManagerTest: XCTestCase {
    var sut:APIManager!
    let manager: Session = {
       let configuration: URLSessionConfiguration = {
           let configuration = URLSessionConfiguration.default
           configuration.protocolClasses = [MockURLProtocol.self]
           return configuration
       }()
           return Session(configuration: configuration)
       }()
    //MARK:- Set up
    override func setUp() {
        sut =  APIManager(session: manager)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_APIManager_WhenStatusCode200_parses_ok(){
        // Given
      let expectedStringRespones = "{\"name\":\"Christina Aguilera\",\"listeners\":\"3045347\",\"mbid\":\"b202beb7-99bd-47e7-8b72-195c8d72ebdd\"}"
        let expectedData =  expectedStringRespones.data(using: .utf8)
        MockURLProtocol.respones(200, expectedData, nil)
        let expectation = XCTestExpectation(description: "Loading")
        
        //When
        sut.performRequest(AritistModelTest.self, router: ArtistRequest.getArtistSearched("Christina Aguilera")) { result in
            // then
            switch result {
            case .success(let data ):
                XCTAssertEqual(data.name, "Christina Aguilera")
            case .failure(let error):
                XCTFail("Request was not successful: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func test_APIManager_WhenStatusCode200_prase_error(){
        // Given
      let expectedStringRespones = "{\"nam\":\"Christina Aguilera\",\"listeners\":\"3045347\",\"mbid\":\"b202beb7-99bd-47e7-8b72-195c8d72ebdd\"}"
        let expectedData =  expectedStringRespones.data(using: .utf8)
        MockURLProtocol.respones(200, expectedData, nil)
        let expectation = XCTestExpectation(description: "Loading")
        let expectedErrorMesaage = "The data couldn’t be read because it is missing."
        
        //When
        sut.performRequest(AritistModelTest.self, router: ArtistRequest.getArtistSearched("Christina Aguilera")) { result in
            // then
            switch result {
            case .success(_):
                XCTFail("Expected parse error to be thrown")
            case .failure(let error):
                
                XCTAssertEqual(error.localizedDescription, expectedErrorMesaage, "Error message doesn't match")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func test_APIManager_WhenNoHttpURLresponse_ShouldReturnServerConnectionMessage(){
        // Given
        let expectedErrorMessage = "Problem connecting to server, Check your Internet connection and try again."
        let expectedError = BaseError.serverConnection
        MockURLProtocol.respones(nil,  nil, expectedError)
        let expectation = XCTestExpectation(description: "Loading")
        
        //When
        sut.performRequest(AritistModelTest.self, router: ArtistRequest.getArtistSearched("Christina Aguilera")) { result in
            // then
            switch result {
            case .success(_):
                XCTFail("Expected no response")
            case .failure(let error):
                XCTAssertEqual(expectedErrorMessage, error.localizedDescription.description, "Error message doesn't match")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    
    func test_APIManager_WhenStatusCode404_ShouldReturnInvalidRequestMessage(){
        // Given
        let expectedErrorMessage = "Failed to connect to the server."
        let ec = NSError.init(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: expectedErrorMessage])
        MockURLProtocol.respones(405,  nil, ec)
        let expectation = XCTestExpectation(description: "Loading")
        
        //When
        sut.performRequest(AritistModelTest.self, router: ArtistRequest.getArtistSearched("Christina Aguilera")) { result in
            // then
            do {
                let _ = try result.get()
                XCTFail("Expected api error to be thrown")
            } catch let error {
                XCTAssertEqual(expectedErrorMessage, error.localizedDescription, "Error message doesn't match")
            }

            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    
    
}
