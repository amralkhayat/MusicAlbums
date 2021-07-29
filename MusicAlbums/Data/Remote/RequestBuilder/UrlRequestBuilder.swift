//
//  NetworkLayer.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import Foundation
import Alamofire
protocol UrlRequestBuilder: URLRequestConvertible {

    // MARK: - Methods
    var method: HTTPMethod { get }

    // MARK: - Path
     var path: String { get }

    // MARK: - Parameters
    var parameters: Parameters? { get }

    // MARK: - Encoding
    var encoding: ParameterEncoding { get }

    // MARK: - URL Request
    var urlRequest: URLRequest { get }
    // MARK: - Main and Request URLS
    var mainURL: URL { get }
    var requestURL: URL { get }
}

extension UrlRequestBuilder {

    var encoding: ParameterEncoding {
           switch method {
           case .get:
               return URLEncoding.default
           default:
               return JSONEncoding.default
           }
       }
     var mainURL: URL {
          return URL(string: "http://ws.audioscrobbler.com/2.0/")!
      }

      var requestURL: URL {
          return mainURL.appendingPathComponent(path)
      }

    var urlRequest: URLRequest {
         var request = URLRequest(url: requestURL)
         request.httpMethod = method.rawValue
         return request
     }

    // MARK: - URLRequestConvertible
      func asURLRequest() throws -> URLRequest {
          return try encoding.encode(urlRequest, with: parameters)
      }

}
