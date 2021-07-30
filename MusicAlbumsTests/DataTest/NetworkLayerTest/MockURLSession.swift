//
//  MockURLSession.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 29/07/2021.
//

import Foundation
import UIKit
@testable import MusicAlbums
class MockURLProtocol: URLProtocol{
    static var loadingHandler: ((URLRequest) -> (HTTPURLResponse, Data?,  Error?))?

    
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
   
        return request
    }
    
    override func startLoading() {
        
        guard let handler = MockURLProtocol.loadingHandler else {
            assertionFailure("Received unexpected request with no handler set")
            return}
            let (response, data,error) =  handler(request)
        print(response.statusCode)
        if let data = data {
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        }else {
        
            client?.urlProtocol(self, didFailWithError: error!)
        }
    }
    
    override func stopLoading() {}
    static func respones (_ statusCode: Int?,_ responseJSONData: Data?, _ Error: Error?  ) {
        MockURLProtocol.loadingHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: statusCode ?? 0, httpVersion: nil, headerFields: nil)!
            return (response, responseJSONData, Error)
        }
    }

}
  

