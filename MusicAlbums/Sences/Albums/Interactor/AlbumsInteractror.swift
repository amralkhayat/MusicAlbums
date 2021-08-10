//
//  AlbumsInteractro.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 31/07/2021.
//

import RealmSwift
protocol AlbumsInteractorProtocol {
    typealias CallResponse<T> = ((Result<T?, BaseError>) -> Void)
    func getSearchedArtist(artistId:String,page:Int,responseHandler: @escaping CallResponse<AlbumModel>)
}

class AlbumsInteractor:InteractorBaseWireFrame, AlbumsInteractorProtocol{
    func getSearchedArtist(artistId: String, page: Int, responseHandler: @escaping CallResponse<AlbumModel>) {
        apiManager.performRequest(AlbumModel.self, router: ArtistRequest.getAlbums(artistId, page)) { result   in
            switch result {
            case .success(let data):
                guard let data = data else {return}
                responseHandler(.success(data))
            case .failure(let error):
                responseHandler(.failure(error))
            }

        }
    }

}
