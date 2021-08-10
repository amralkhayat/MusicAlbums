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
        func collectionViewReload()
    }

    protocol AlbumsPresenter {
        func viewDidLoad()
        func populateAlbums()
        func dataHandling(data:AlbumModel)
        var numberOfrow: Int {get}
        func didSelect(item: Int)
        func configurationArtistCell (cell:AlbumCellView, index: Int)
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
    private var isHiden = true
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
    
    
   // MARK:- populate All Albums
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
        currentPage += 1
        self.view?.collectionViewReload()
    }
    
    //MARK:- Prefetch data
    func prefetchRowsAt(indexPath: [IndexPath]){
      for index in indexPath{
        if index.row >= album.count - 3{
            populateAlbums()
            self.view?.collectionViewReload()
        }
          break
        }
      }
    
    //MARK:-  TableView Methods
    var numberOfrow: Int {
        return album.count
    }
    
    // Configuration responsable to display Album data
     func configurationArtistCell (cell:AlbumCellView, index: Int) {
      cell.displayCellBody(album: album[index])
        
    }
    
    func didSelect(item: Int) {
        let album = album[item]
        var albumConfiguration = AlbumConfiguratinModel()
        albumConfiguration.artistName = album.artist.name ?? ""
        albumConfiguration.albumName = album.name ?? ""
        albumConfiguration.albumId = album.mbid ?? ""
        router.routeToAlbumsDetails(From: self.view!, albumConfiguration:  albumConfiguration)
    }
    
    
}
