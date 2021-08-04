//
//  MainScreenPresenter.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 04/08/2021.
//

import Foundation

protocol MainScreenViewProtocol: AnyObject{
    func showPlacehoder(status: Bool ,message: String)
    func show(_ Message: String)
    func reloadCollectionView()
    
}

protocol MainScreenPresenter {
    func viewDidLoad()
    func readObjects()
    var numberOfItems:Int {get}
    func didSelect(item: Int)
    func configurationAlbumCell (cell:LocalAlbumCellView , index: Int)
}

protocol LocalAlbumCellView {
 func displayCellBody(album: AlbumData)
}

class MainScreenVCPresenter: MainScreenPresenter {

    //MARK:- Properties
    weak var view: MainScreenViewProtocol?
    private var interactor:  MainScreenInteractorProtocol
    private  var router: MainScreenRouterProtocol
    var albumsData = [AlbumData]()
    // init
    init(view:MainScreenViewProtocol, interactor: MainScreenInteractorProtocol , router: MainScreenRouterProtocol ) {
        self.view = view
        self.interactor = interactor
        self.router =  router
    }
    //MARK:- METHODS
    func viewDidLoad() {
        readObjects()
    }
    
    func readObjects() {
        interactor.readObject { [weak self] respones in
            guard let self = self else {return}
            switch respones{
            case .success(let data):
                guard let data = data else {return}
                self.albumsData =  data
                self.checkDataIsEmpty()
                self.view?.reloadCollectionView()
                
            case .failure(let error):
                self.view?.show(error.localizedDescription)
                self.checkDataIsEmpty()
                self.albumsData.removeAll()
                self.view?.reloadCollectionView()
            }
        }
    }
    
    func checkDataIsEmpty(){
      if albumsData.isEmpty{
          self.view?.showPlacehoder(status: true, message: "Empty Albums🤭")
         }
    }
    
 //MARK:- TableView Methods
    var numberOfItems: Int {
        return albumsData.count
    }
    
    // Configuration responsable to display Album data
     func configurationAlbumCell (cell:LocalAlbumCellView , index: Int) {
        cell.displayCellBody(album:albumsData[index])
        
    }
    
    func didSelect(item: Int) {
        let album = albumsData[item]
        var albumConfiguration = AlbumConfiguratinModel()
        albumConfiguration.artistName = album.artist ?? ""
        albumConfiguration.albumName = album.name ?? ""
        router.routeToAlbumsDetails(From: self.view!, albumConfiguration: albumConfiguration)
    }
    
    
}
