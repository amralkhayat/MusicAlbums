//
//  AlbumDetailsRouter.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 01/08/2021.
//

import UIKit

protocol AlbumDetailsRouterProtocol {
    static func AlbumsDetailsRouterVC(albumDetails:AlbumDetailsModel) -> UIViewController
}

class AlbumDetailsRouter: AlbumDetailsRouterProtocol {
    static func AlbumsDetailsRouterVC(albumDetails: AlbumDetailsModel) -> UIViewController {
        let view =  AlbumDetailsViewController()
        let interactor = AlbumDetailsInteractor()
        let router = AlbumDetailsRouter()
        let presenter = AlbumDetailsVcPresnter(view: view , interactor: interactor, router:router  ,albumDetailsModel: albumDetails)
        view.presenter = presenter
        return view
    }
    
  
    
}
