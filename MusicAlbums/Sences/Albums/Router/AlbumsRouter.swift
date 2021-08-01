//
//  AlbumsRouter.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 31/07/2021.
//

import UIKit
protocol AlbumsRouterProtocol {
    static func AlbumsRouterVC(artistId:String) -> UIViewController
    func routeToAlbumsDetails(From view:  AlbumsViewProtocol, albumDeatils: AlbumDetailsModel)
}

class AbumsRouter: AlbumsRouterProtocol {
    
    
    static func AlbumsRouterVC(artistId: String) -> UIViewController {
        let view = Albums()
        let interactor = AlbumsInteractor()
        let router = AbumsRouter()
        let presenter = AlbumsVCPresenter(view: view, interactor: interactor , router: router, artistId: artistId)
        view.presenter = presenter
        return view
    }
    
    
    func routeToAlbumsDetails(From view:  AlbumsViewProtocol, albumDeatils: AlbumDetailsModel) {
        let ToAlbumDetailsScreen =  AlbumDetailsRouter.AlbumsDetailsRouterVC(albumDetails: albumDeatils)
        if let viewController = view as? UIViewController {
            DispatchQueue.main.async {
         viewController.navigationController?.pushViewController(ToAlbumDetailsScreen , animated: true)
            }

        }
    }
    
    
}
