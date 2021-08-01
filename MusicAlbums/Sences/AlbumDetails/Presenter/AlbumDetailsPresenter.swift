//
//  AlbumDetailsPresenter.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 01/08/2021.
//

import Foundation

protocol AlbumDetailsViewProtocol: AnyObject{
    
}

protocol AlbumDetailsPresnter{
}



protocol AlbumDetailsCellView {
    func displayCellBody(albumDetails: AlbumDetailsModel)
}


class AlbumDetailsVcPresnter: AlbumDetailsPresnter{
    //MARK:- Properties
    weak var view: AlbumDetailsViewProtocol?
    var interactor: AlbumDetailsInteractorProtocol
    var router: AlbumDetailsRouterProtocol
    var albumDetails:AlbumDetailsModel
    init( view: AlbumDetailsViewProtocol,interactor: AlbumDetailsInteractorProtocol,router: AlbumDetailsRouterProtocol, albumDetailsModel:AlbumDetailsModel ) {
        self.view =  view
        self.interactor = interactor
        self.router = router
        self.albumDetails = albumDetailsModel
    }
    
     func configurationAlbumDetailsCell (cell:AlbumDetailsCellView) {
      cell.displayCellBody(albumDetails: albumDetails)
        
    }
    
}
