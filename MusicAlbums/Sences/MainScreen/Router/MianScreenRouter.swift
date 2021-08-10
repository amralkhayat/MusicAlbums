//
//  MianScreenRouter.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 04/08/2021.
//

import UIKit
protocol MainScreenRouterProtocol {
    static func mainScreenRouterVC (view: MainScreen)
    func routeToAlbumsDetails(From view: MainScreenViewProtocol, albumConfiguration: AlbumConfiguratinModel)
}

class MainScreenRouter: MainScreenRouterProtocol {
       // Init View of the Main Screen
    static func mainScreenRouterVC(view: MainScreen) {
        let interactor =  MainScreenInteractor()
        let router = MainScreenRouter()
        let presenter =  MainScreenVCPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
    }
    //MARK:- Navigate to the Album details and pass albumConfiguration
    func routeToAlbumsDetails(From view: MainScreenViewProtocol, albumConfiguration: AlbumConfiguratinModel) {
        let ToAlbumDetailsScreen =  AlbumDetailsRouter.AlbumsDetailsRouterVC(albumConfiguration: albumConfiguration)
        if let viewController = view as? UIViewController {
            DispatchQueue.main.async {
         viewController.navigationController?.pushViewController(ToAlbumDetailsScreen , animated: true)
            }

        }
    }
    
    
}
