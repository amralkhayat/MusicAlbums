//
//  AlbumsRouter.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 31/07/2021.
//

import UIKit
protocol AlbumsRouterProtocol {
    static func AlbumsRouterVC(artistId:String) -> UIViewController
    func routeToAlbumsDetails(From view:  AlbumsViewProtocol, albumConfiguration: AlbumConfiguratinModel)
}

class AbumsRouter: AlbumsRouterProtocol {
    // Init View of the Albums
    static func AlbumsRouterVC(artistId: String) -> UIViewController {
        let view = Albums()
        let interactor = AlbumsInteractor()
        let router = AbumsRouter()
        let presenter = AlbumsVCPresenter(view: view, interactor: interactor , router: router, artistId: artistId)
        view.presenter = presenter
        return view
    }
    
    //MARK:- Navigate the Album details and pass albumConfiguration
    func routeToAlbumsDetails(From view:  AlbumsViewProtocol, albumConfiguration: AlbumConfiguratinModel) {
        let ToAlbumDetailsScreen =  AlbumDetailsRouter.AlbumsDetailsRouterVC(albumConfiguration: albumConfiguration)
        if let viewController = view as? UIViewController {
            DispatchQueue.main.async {
         viewController.navigationController?.pushViewController(ToAlbumDetailsScreen , animated: true)
            }

        }
    }
    
    
}
