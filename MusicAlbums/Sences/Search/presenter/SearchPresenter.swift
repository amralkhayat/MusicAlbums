//
//  SearchPresenter.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import Foundation
protocol SearchViewProtocol: AnyObject{
    func showIndecator ()
    func hideIndecator ()
    func tableviewReload()
}

protocol SearchPresenter {
    func viewDidLoad()
    func populateArtistSearch()
////    func formatingData(_ model: TopStoriesModel)
//    func numberOfRows () -> Int
    
}

protocol ArtistCellView {
//    func displayBody(data: TopStoriesCellModel)
}


class SearchVCPresenter: SearchPresenter {

    
    //MARK:- Properties
    weak var view:SearchViewProtocol?
    private var interactor:  SearchInteractorProtocol
    private  var router: SearchRouterProtocol
    init(view:SearchViewProtocol, interactor: SearchInteractorProtocol , router: SearchRouterProtocol ) {
        self.view = view
        self.interactor = interactor
        self.router =  router
    }
    
    func viewDidLoad() {
        populateArtistSearch()
    }
    
    func populateArtistSearch() {
        interactor.getSearchedArtist(artistName: "Christina Aguilera") { [weak self]  respones  in
            guard let self =  self else {return}
            switch respones {
            case .success(let data):
                print(data)
//                self.formatingData(data)
            case .failure(let error):
               print(error)
            }
        }
    }
}
