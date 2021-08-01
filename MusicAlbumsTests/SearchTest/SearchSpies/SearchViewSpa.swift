//
//  SearchViewTest.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 30/07/2021.
//

import Foundation
@testable import MusicAlbums
class SarchViewSpy: SearchViewProtocol{
    var placeholderCalled = false
    var placeHolderMessage = ""
    var errorMessage = ""
    var tableViewRelaodIsCalled = false
    func showError(message: String) {
       errorMessage = message
    }
    
    func tableviewReload() {
        tableViewRelaodIsCalled = true
    }
    
    func showPlacehoder(status: Bool, message: String) {
       placeholderCalled =  status
        placeHolderMessage = message
    }
    
    
}
