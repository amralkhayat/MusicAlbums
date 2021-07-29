//
//  Router.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import Foundation
protocol SearchRouterProtocol: AnyObject {
    static func searchRouterVC (view: Search)
//  func passData(From view: TopStoriesViewProtocol , data: TopStoriesDetailsModel)
}
class SearchRouter: SearchRouterProtocol {
    static func searchRouterVC(view: Search) {
        let interactor =  SearchInteractor()
        let router = SearchRouter()
        let presenter =  SearchVCPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
    }
    
    
}
