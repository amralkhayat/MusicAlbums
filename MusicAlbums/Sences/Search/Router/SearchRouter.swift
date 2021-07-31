//
//  Router.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import UIKit
protocol SearchRouterProtocol: AnyObject {
    static func searchRouterVC (view: Search)
    func routeToAlbums(From view: SearchViewProtocol , artistId: String)
}
class SearchRouter: SearchRouterProtocol {
    static func searchRouterVC(view: Search) {
        let interactor =  SearchInteractor()
        let router = SearchRouter()
        let presenter =  SearchVCPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
    }
    
    func routeToAlbums(From view: SearchViewProtocol, artistId: String) {
        let TopDetailsScreen =  AbumsRouter.AlbumsRouterVC(artistId: artistId)
        if let viewController = view as? UIViewController {
            DispatchQueue.main.async {
         viewController.navigationController?.pushViewController(TopDetailsScreen , animated: true)
            }

        }
    }
    
    
}
