//
//  NetworkRequestError.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import Foundation
enum BaseError: Error {
    case unknownError
    case authorizationError
    case invalidRequest
    case serverError
    case serverConnection
    case noResponce
    case other(text: String)

    var localizedDescription: String {
        switch self {
        case .invalidRequest:
            return "Failed to connect to the server."
        case .authorizationError:
            return "Session Has Expired."
        case .serverConnection:
            return "Problem connecting to server, Check your Internet connection and try again."
        case .other(let message):
            return message
        default:
            return ""
        }
    }
}

