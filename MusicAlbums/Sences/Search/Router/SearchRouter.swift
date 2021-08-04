//
//  Router.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import UIKit
protocol SearchRouterProtocol: AnyObject {
    static func searchRouterVC (view: Search)
    func routeToAlbums(From view: SearchViewProtocol , artistName: String)
}
class SearchRouter: SearchRouterProtocol {
    static func searchRouterVC(view: Search) {
        let interactor =  SearchInteractor()
        let router = SearchRouter()
        let presenter =  SearchVCPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
    }
    
    func routeToAlbums(From view: SearchViewProtocol, artistName: String) {
        let TopDetailsScreen =  AbumsRouter.AlbumsRouterVC(artistId: artistName)
        if let viewController = view as? UIViewController {
            DispatchQueue.main.async {
         viewController.navigationController?.pushViewController(TopDetailsScreen , animated: true)
            }

        }
    }
    
    
}
