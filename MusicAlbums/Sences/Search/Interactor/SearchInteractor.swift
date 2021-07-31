//
//  SearchInteractor.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import Foundation
protocol SearchInteractorProtocol {
    typealias CallResponse<T> = ((Result<T?, BaseError>) -> Void)
    func getSearchedArtist(artistName:String,page:Int,responseHandler: @escaping CallResponse<ArtistModel>)
}
class SearchInteractor: SearchInteractorProtocol{
    let  apiManager = APIManager()
    func getSearchedArtist(artistName:String,page:Int,responseHandler: @escaping CallResponse<ArtistModel>) {
        apiManager.performRequest(ArtistModel.self, router: ArtistRequest.getArtistSearched(artistName, page)) { result  in
            
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
