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
    func showError(message: String)
    func tableviewReload()
    func showPlacehoder(status: Bool)
}

protocol SearchPresenter {
    func viewDidLoad()
    func populateArtistSearch(artistName:String)
    func search(artist: String)
    var numberOfRows: Int {get }
    
}

protocol ArtistCellView {
    func displayCellBody(artist: Artist)
}


class SearchVCPresenter: SearchPresenter {

    //MARK:- Properties
    weak var view:SearchViewProtocol?
    private var interactor:  SearchInteractorProtocol
    private  var router: SearchRouterProtocol
    private var isSearching = false
    private var artists =  [Artist]()
    init(view:SearchViewProtocol, interactor: SearchInteractorProtocol , router: SearchRouterProtocol ) {
        self.view = view
        self.interactor = interactor
        self.router =  router
    }

    
    func viewDidLoad() {
        self.view?.showPlacehoder(status: true)
    }
    
    func search(artist: String) {
        if artist.isEmpty {
            isSearching  = false
            view?.showPlacehoder(status: true)
            artists.removeAll()
        } else{
            isSearching  = true
            view?.showPlacehoder(status: false)
            artists.removeAll()
            populateArtistSearch(artistName: artist)
        }
        self.view?.tableviewReload()
    }
    
        func populateArtistSearch(artistName:String) {
            interactor.getSearchedArtist(artistName: artistName) {  [weak self] respones  in
                guard let self = self else {return}
                switch respones {
                case .success(let data):
                    self.view?.showIndecator()
                 self.artists = data.results.artistmatches.artist
                    print(self.artists)
                    self.view?.tableviewReload()
                case .failure(let error):
                    self.view?.hideIndecator()
                    self.view?.showError(message: error.localizedDescription)
                }
            }
        }
    
    var numberOfRows: Int {
        return isSearching ? artists.count : 0
    }
    
    // Configuration responsable to display Artist data
func configurationArtistCell (cell:ArtistCellView, index: Int) {
    cell.displayCellBody(artist: artists[index])
    }
}

