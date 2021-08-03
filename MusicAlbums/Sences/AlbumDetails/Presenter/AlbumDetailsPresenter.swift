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
    func reloadTableView()
    func showAlbumImage(url: String)
}

protocol AlbumDetailsPresnter{
    func viewdidLoad()
    func writeObject(album:AlbumInfo)
    func deleteObject(album:AlbumInfo)
    func readObject(primaryKey: String)
    func populateAlbumInfoFromApiRequest()
    func populateAlbumInfo()
    var numberTracks: Int {get}
}



protocol HeaderCellView {
    func displayCellBody(albumDetails: AlbumInfo)
}

protocol TracksCellView {
    func displayCellBody(tracks:Track)
}


class AlbumDetailsVcPresnter: AlbumDetailsPresnter{
   
    //MARK:- Properties
    weak var view: AlbumDetailsViewProtocol?
    var interactor: AlbumDetailsInteractorProtocol
    var router: AlbumDetailsRouterProtocol
    var albumInfo:AlbumInfo?
    var albumDetails: AlbumDetailsModel
    init( view: AlbumDetailsViewProtocol,interactor: AlbumDetailsInteractorProtocol,router: AlbumDetailsRouterProtocol, albumDetailsModel:AlbumDetailsModel) {
        self.view =  view
        self.interactor = interactor
        self.router = router
        self.albumDetails = albumDetailsModel
    }
    
 
    func viewdidLoad() {
        populateAlbumInfo()
    }
    
    func populateAlbumInfo() {
        if interactor.AlbumExists(primaryKey: albumDetails.albumName ?? "") == true{
            
            readObject(primaryKey:  albumDetails.albumName ?? "")
        }else {
        populateAlbumInfoFromApiRequest()

        }
        
        
    }

    
    // save album to the local data storage
    func writeObject(album:AlbumInfo){
        self.view?.showIndecator()
        interactor.saveObject(album: albumInfo ?? AlbumInfo()) { [weak self] respones in
            guard let self = self else {return}
            switch respones {
            case .success(let message):
                guard let message = message else {return}
                self.view?.show(message)
                self.view?.hideIndecator()
            case .failure(let error):
                self.view?.show(error.localizedDescription)
                self.view?.hideIndecator()
            }
        }
    }
    
    // Delete album from the local data storage
    func deleteObject(album:AlbumInfo){
        self.view?.showIndecator()
        interactor.deleteObject(album: albumInfo ?? AlbumInfo()) {  [weak self] respones in
                guard let self = self else {return}
                switch respones {
                case .success(let message):
                    guard let message = message else {return}
                    self.view?.show(message)
                    self.view?.hideIndecator()
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
                self.view?.reloadTableView()
             case .failure(let error):
                 self.view?.show(error.localizedDescription)
                 self.view?.hideIndecator()
             }
        }
    }
    // populate Album Info from request API
    func populateAlbumInfoFromApiRequest() {
        self.view?.showIndecator()
        interactor.getAlbumInfo(artistName: albumDetails.artistName ?? "", albumId: albumDetails.albumId) { [weak self ] respones in
            guard let self = self else {return}
            switch respones {
            case .success(let data):
                self.view?.hideIndecator()
                self.albumInfo = data
                self.view?.showAlbumImage(url: self.albumInfo?.album?.image[2].text ?? "")
                self.view?.reloadTableView()
            case .failure(let error):
                self.view?.hideIndecator()
                self.view?.show(error.localizedDescription)
            }
        }
    }
    
    var numberTracks: Int {
        return albumInfo?.album?.tracks?.track.count ?? 0
    }
    //MARK:- TableViewMethods
    func configurationHeaderCell (cell:HeaderCellView) {
        guard let albumInfo = albumInfo else {return}
        cell.displayCellBody(albumDetails: albumInfo)
     }
   
    func configurationTracksCellViewCell (cell:TracksCellView ,index: Int) {
        guard let track = albumInfo?.album?.tracks?.track[index] else {return}
        cell.displayCellBody(tracks:  track )
   }
    

}
