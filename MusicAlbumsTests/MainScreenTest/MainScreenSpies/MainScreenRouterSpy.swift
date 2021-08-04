//
//  MainScreenRouterSpy.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 04/08/2021.
//

import Foundation
@testable import MusicAlbums
class MainScreenRouterSpy: MainScreenRouterProtocol{
    var isRouteToAlbumsDetailsCalled = false
    static func mainScreenRouterVC(view: MainScreen) {
        
    }
    
    func routeToAlbumsDetails(From view: MainScreenViewProtocol, albumConfiguration: AlbumConfiguratinModel) {
        isRouteToAlbumsDetailsCalled = true
        
    }
}
