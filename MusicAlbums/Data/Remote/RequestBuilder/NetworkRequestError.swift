//
//  NetworkRequestError.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import Foundation
enum BaseError: Error {
    case unknownError(text:String)
    case invalidRequest
    case serverError
    case serverConnection
 
  

    var localizedDescription: String {
        switch self {
        case .invalidRequest:
            return "Failed to connect to the server."

        case .serverConnection:
            return "Problem connecting to server, Check your Internet connection and try again."
        case .unknownError(let message):
            return message
        default:
            return ""
        }
    }
}

