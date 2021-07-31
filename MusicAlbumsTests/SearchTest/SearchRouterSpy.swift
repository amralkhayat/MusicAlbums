//
//  SearchRouterSpy.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 30/07/2021.
//

import Foundation
@testable import MusicAlbums
class SearchRouterSpy: SearchRouterProtocol {
  
    var isNavigateCalled = false
    static func searchRouterVC(view: Search) {
        
    }
    
    func routeToAlbums(From view: SearchViewProtocol, artistId: String) {
        isNavigateCalled = true
        
    }
    
}
