//
//  AlbumsViewSpy.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 31/07/2021.
//

import Foundation
@testable import MusicAlbums
class AlbumsViewSpy:AlbumsViewProtocol{
    var showIndecatorIsCalled =  false
    var hideIndecatorIsCalled =  false
    var reloadTableView = false
    var errorMessage = ""
    
    func showIndecator() {
        showIndecatorIsCalled =  true
    }
    
    func hideIndecator() {
        hideIndecatorIsCalled = true
    }
    
    func showError(_ Message: String) {
        errorMessage = Message
    }
    
    func tableviewReload() {
      reloadTableView = true
    }
    
    
}
