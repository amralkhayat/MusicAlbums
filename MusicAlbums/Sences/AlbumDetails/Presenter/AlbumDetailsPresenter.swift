//
//  AlbumDetailsPresenter.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 01/08/2021.
//

import Foundation

protocol AlbumDetailsViewProtocol: AnyObject{
    func showIndecator ()
    func hideIndecator ()
    func show(_ Message: String)
    func deleteObject(_ Message: String)
    func reloadTableView()
    func showAlbumImage(url: String)
}

protocol AlbumDetailsPresnter{
    func viewdidLoad()
    func writeObject(album:AlbumData)
    func deleteObject(album:AlbumData)
    func readObject(primaryKey: String)
    func populateAlbumInfoFromApiRequest()
    func populateAlbumInfo()
    var numberTracks: Int {get}
    func downloadAndDelete() -> Bool
}



protocol HeaderCellView {
    func displayCellBody(albumDetails: AlbumData)
    func albumIsDownloaded (status:Bool)
}

protocol TracksCellView {
    func displayCellBody(tracks:Track)
}


class AlbumDetailsVcPresnter: AlbumDetailsPresnter{
    //MARK:- Properties
    weak var view: AlbumDetailsViewProtocol?
    var interactor: AlbumDetailsInteractorProtocol
    var router: AlbumDetailsRouterProtocol
    var albumInfo:AlbumData?
    var albumConfiguration: AlbumConfiguratinModel
    var isDownloaded = false
    
    init( view: AlbumDetailsViewProtocol,interactor: AlbumDetailsInteractorProtocol,router: AlbumDetailsRouterProtocol, albumConfiguration: AlbumConfiguratinModel) {
        self.view =  view
        self.interactor = interactor
        self.router = router
        self.albumConfiguration = albumConfiguration
    }
    
 
    func viewdidLoad() {
        populateAlbumInfo()
    }
   
    // check if object is exist download form local stroage or from server
    func populateAlbumInfo() {
       
        if interactor.AlbumExists(primaryKey: albumConfiguration.albumName ){
            self.readObject(primaryKey:  self.albumConfiguration.albumName )
            isDownloaded = true
        }else {
        populateAlbumInfoFromApiRequest()
            isDownloaded = false
        }
    }
   //MARK:- Realm CURD Methods
    // save album to the local data storage
    func writeObject(album:AlbumData){
        self.view?.showIndecator()
        interactor.saveObject(album: album) { [weak self] respones in
            guard let self = self else {return}
            switch respones {
            case .success(let message):
                guard let message = message else {return}
                self.view?.show(message)
                self.isDownloaded = true
                self.view?.hideIndecator()
            case .failure(let error):
                self.view?.show(error.localizedDescription)
                self.view?.hideIndecator()
            }
        }
    }
    
    // Delete album from the local data storage
    func deleteObject(album:AlbumData){
        self.view?.showIndecator()
        interactor.deleteObject(album: album ) {  [weak self] respones in
                guard let self = self else {return}
                switch respones {
                case .success(let message):
                    guard let message = message else {return}
                    self.view?.deleteObject(message)
                    self.view?.hideIndecator()
                    self.isDownloaded = false
                case .failure(let error):
                    self.view?.show(error.localizedDescription)
                    self.view?.hideIndecator()
                }
        }
    }
    // Read album from the local data storage
    func readObject(primaryKey: String) {
        interactor.readObject(primaryKey:  primaryKey) { [weak self]respones in
            guard let self = self else {return}
             switch respones {
             case .success(let data):
                self.view?.hideIndecator()
                    self.albumInfo =  data
                self.view?.showAlbumImage(url: self.albumInfo?.image[2].text ?? "")
                self.view?.reloadTableView()
             case .failure(let error):
                 self.view?.show(error.localizedDescription)
                 self.view?.hideIndecator()
             }
        }
    }
    

    func downloadAndDelete() -> Bool {
        guard let object =  albumInfo else { return false}
        if isDownloaded{
            deleteObject(album: object)
            isDownloaded = false
            return isDownloaded
        }else{
            print(albumInfo ?? AlbumInfo())
            writeObject(album:object)
            isDownloaded = true
            return isDownloaded
        }
    }
    
    //MARK:-  populate Album Info from request API
    func populateAlbumInfoFromApiRequest() {
        self.view?.showIndecator()
        interactor.getAlbumInfo(artistName: albumConfiguration.artistName , albumName: albumConfiguration.albumName) { [weak self ] respones in
            guard let self = self else {return}
            switch respones {
            case .success(let data):
                self.view?.hideIndecator()
                self.albumInfo = data?.album
                self.view?.showAlbumImage(url: self.albumInfo?.image[2].text ?? "")
                self.view?.reloadTableView()
            case .failure(let error):
                self.view?.hideIndecator()
                self.view?.show(error.localizedDescription)
            }
        }
    }
    //MARK:- TableView Methods
    var numberTracks: Int {
        return albumInfo?.tracks?.track.count ?? 0
    }
    //MARK:- TableViewMethods
    func configurationHeaderCell (cell:HeaderCellView) {
        guard let albumInfo = albumInfo else {return}
        cell.displayCellBody(albumDetails: albumInfo)
        cell.albumIsDownloaded(status: isDownloaded)
     }
   
    func configurationTracksCellViewCell (cell:TracksCellView ,index: Int) {
        guard let track = albumInfo?.tracks?.track[index] else {return}
        cell.displayCellBody(tracks:  track )
   }
    

}
