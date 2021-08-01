//
//  AlbumsRouterSpy.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 31/07/2021.
//

import UIKit
@testable import MusicAlbums
class AlbumsRouterSpy:AlbumsRouterProtocol{
      var isRouteToAlbumsDetailsCalled = false
    func routeToAlbumsDetails(From view: AlbumsViewProtocol, albumDeatils: AlbumDetailsModel) {
        isRouteToAlbumsDetailsCalled = true
    }
    
    static func AlbumsRouterVC(artistId: String) -> UIViewController {
        return UIViewController()
    }
    
    
}
