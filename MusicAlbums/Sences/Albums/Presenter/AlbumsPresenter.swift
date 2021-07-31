//
//  AlbumsPresenter.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 31/07/2021.
//

import Foundation

    protocol AlbumsViewProtocol: AnyObject{
        func showIndecator ()
        func hideIndecator ()
        func showError(_ Message: String)
        func tableviewReload()
    }
    protocol AlbumsPresenter {
        func viewDidLoad()
        func populateAlbums()
        func dataHandling(data:AlbumModel)
        var numberOfrow: Int {get}
    }
   protocol AlbumCellView {
    func displayCellBody(album: Album)
   }

class AlbumsVCPresenter: AlbumsPresenter {
    //MARK:- Properties
    weak var view: AlbumsViewProtocol?
    private var interactor: AlbumsInteractorProtocol
    private var router: AlbumsRouterProtocol
    private var artistId: String
    private var currentPage = 1
     var album = [Album]()
    init(view: AlbumsViewProtocol,interactor: AlbumsInteractorProtocol,
         router: AlbumsRouterProtocol, artistId: String) {
        self.view = view
        self.interactor = interactor
        self.router =  router
        self.artistId = artistId
    }
    
    
    func viewDidLoad() {
      populateAlbums()
    }
    
    // populate All Albums
    func populateAlbums() {
        view?.showIndecator()
        interactor.getSearchedArtist(artistId: artistId, page: currentPage) { [weak self] respones in
            guard let self = self else {return}
            switch respones {
            case .success(let data):
             guard let data = data else {return}
                self.dataHandling(data: data)
            case .failure(let error):
                self.view?.hideIndecator()
                self.view?.showError(error.localizedDescription)
            }
        }
    }
    
    func dataHandling(data: AlbumModel) {
        self.view?.hideIndecator()
        self.album = data.topalbums.album
        self.view?.tableviewReload()
    }
    
    //MARK:-  TableView Methods
    var numberOfrow: Int {
        return album.count
    }
    
    // Configuration responsable to display Album data
     func configurationArtistCell (cell:AlbumCellView, index: Int) {
      cell.displayCellBody(album: album[index])
        
    }
    
}
