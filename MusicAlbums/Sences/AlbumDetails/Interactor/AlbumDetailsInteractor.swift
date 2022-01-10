//
//  AlbumDetailsInteractor.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 01/08/2021.
//

import Foundation
import RealmSwift
protocol AlbumDetailsInteractorProtocol {
    typealias CallResponse<T> = ((Result<T?, RuntimeError>) -> Void)
    
    func saveObject(album:AlbumData,  responseHandler: @escaping CallResponse<String>)
    func deleteObject(album: AlbumData, responseHandler: @escaping CallResponse<String>)
    func readObject(primaryKey: String, responseHandler: @escaping CallResponse<AlbumData>)
    
    typealias CallResponseRemote<T> = ((Result<T?, BaseError>) -> Void)
    func getAlbumInfo(artistName:String,albumName:String,responseHandler: @escaping CallResponseRemote<AlbumInfo>)
    func AlbumExists(primaryKey: String) -> Bool
}

class AlbumDetailsInteractor: AlbumDetailsInteractorProtocol{

    let realm =  RealmManager()
    let  apiManager = APIManager()
    // save data to storage Method
    func saveObject(album: AlbumData, responseHandler: @escaping CallResponse<String>) {
        realm.create(album) { respones in
            switch respones {
            case .success(let message):
                responseHandler(.success(message))
            case .failure(let error):
                responseHandler(.failure(RuntimeError.NoRealmSet(error.localizedDescription)))
            }
        }
    }
    // Delete from storage Method
    func deleteObject(album: AlbumData, responseHandler: @escaping CallResponse<String>) {
        realm.delete(album) { respones  in
            switch respones {
            case .success(let message):
                responseHandler(.success(message))
            case .failure(let error):
                responseHandler(.failure(RuntimeError.NoRealmSet(error.localizedDescription)))
            }
        }
    
       }
    
    
    func readObject(primaryKey: String,responseHandler: @escaping CallResponse<AlbumData>) {
        let  data = realm.read(AlbumData.self, primaryKey: primaryKey)
           if  data != nil{
               responseHandler(.success(data))
           }else{
               responseHandler(.failure(RuntimeError.NoRealmSet("Data can not retrieve ")))
           }
    }
    
    func AlbumExists(primaryKey: String) -> Bool {
        return realm.objectExists(AlbumData.self, primaryKey: primaryKey)

    }
    
    
    func getAlbumInfo(artistName: String, albumName:String, responseHandler: @escaping CallResponseRemote<AlbumInfo>) {
        apiManager.performRequest(AlbumInfo.self, router: ArtistRequest.getAlbumInfo(artistName, albumName)) { result in
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

