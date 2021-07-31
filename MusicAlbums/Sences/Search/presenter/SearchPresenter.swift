//
//  SearchPresenter.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import Foundation
protocol SearchViewProtocol: AnyObject{
    func showError(message: String)
    func tableviewReload()
    func showPlacehoder(status: Bool ,message: String)
}

protocol SearchPresenter {
    func viewDidLoad()
    func populateArtistSearch(artistName:String)
    func dataHandling(data:ArtistModel)
    func search(artist: String)
    var numberOfRows: Int {get }
    func prefetchRowsAt(indexPath: [IndexPath])
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
    var artists =  [Artist]()
    private var currentPage = 1
    private var artistName = String()
    // init
    init(view:SearchViewProtocol, interactor: SearchInteractorProtocol , router: SearchRouterProtocol ) {
        self.view = view
        self.interactor = interactor
        self.router =  router
    }

    //MARK:- Methods
    func viewDidLoad() {
        self.view?.showPlacehoder(status: true, message: "Search for Artist you Love ❤️")
    }
    
    func search(artist: String) {
        artistName = artist
        if artist.isEmpty {
            isSearching  = false
            view?.showPlacehoder(status: true, message: "Search for Artist you Love ❤️")
            artists.removeAll()
        } else{
            isSearching  = true
            view?.showPlacehoder(status: false, message: "Search for Artist you Love ❤️")
            artists.removeAll()
            populateArtistSearch(artistName: artist)
        }
        self.view?.tableviewReload()
    }
    
    
        func populateArtistSearch(artistName:String) {
            interactor.getSearchedArtist(artistName: artistName, page: currentPage) {  [weak self] respones  in
                guard let self = self else {return}
                switch respones {
                case .success(let data):
                    guard let data = data else {return}
                    self.dataHandling(data: data)
                case .failure(let error):
                    self.view?.showError(message: error.localizedDescription)
                }
            }
        }
    
    
      func dataHandling(data:ArtistModel){
         artists = data.results.artistmatches.artist
         if artists.isEmpty {
         self.view?.showPlacehoder(status: true, message: "The artist you have searched for not available 😔")
          }
        self.view?.tableviewReload()
        currentPage += 1
    }

    
    // MARK:- handling tableview Methods
    
    var numberOfRows: Int {
        return isSearching ? artists.count : 0
    }
    
    // Configuration responsable to display Artist data
     func configurationArtistCell (cell:ArtistCellView, index: Int) {
    cell.displayCellBody(artist: artists[index])
    }
    
    //MARK:- Prefetch data
    func prefetchRowsAt(indexPath: [IndexPath]){
      for index in indexPath{
        if index.row >= artists.count - 3{
            populateArtistSearch(artistName: artistName)
            self.view?.tableviewReload()
        }
          break
        }
      }
    }
