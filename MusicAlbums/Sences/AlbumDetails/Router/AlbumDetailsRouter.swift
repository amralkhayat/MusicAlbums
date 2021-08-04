//
//  AlbumDetailsRouter.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 01/08/2021.
//

import UIKit

protocol AlbumDetailsRouterProtocol {
    static func AlbumsDetailsRouterVC(albumConfiguration: AlbumConfiguratinModel) -> UIViewController
}

class AlbumDetailsRouter: AlbumDetailsRouterProtocol {
    static func AlbumsDetailsRouterVC(albumConfiguration: AlbumConfiguratinModel) -> UIViewController {
        let view =  AlbumDetailsViewController()
        let interactor = AlbumDetailsInteractor()
        let router = AlbumDetailsRouter()
        let presenter = AlbumDetailsVcPresnter(view: view , interactor: interactor, router:router  ,albumConfiguration: albumConfiguration)
        view.presenter = presenter
        return view
    }
    
  
    
}
