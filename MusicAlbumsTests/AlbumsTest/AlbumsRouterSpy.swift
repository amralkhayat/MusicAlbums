//
//  AlbumsRouterSpy.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 31/07/2021.
//

import UIKit
@testable import MusicAlbums
class AlbumsRouterSpy:AlbumsRouterProtocol{
    static func AlbumsRouterVC(artistId: String) -> UIViewController {
        return UIViewController()
    }
    
    
}
