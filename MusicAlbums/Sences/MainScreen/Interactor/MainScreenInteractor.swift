//
//  Interactor.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 04/08/2021.
//

import Foundation
import RealmSwift
protocol MainScreenInteractorProtocol {
    typealias CallResponse<T> = ((Result<T?, RuntimeError>) -> Void)
    func readObject(responseHandler: @escaping CallResponse<[AlbumData]>)
}


class MainScreenInteractor: MainScreenInteractorProtocol{
    let realm =  RealmManager()
    func readObject(responseHandler: @escaping CallResponse<[AlbumData]>) {
     
       let data =  realm.readObjects(AlbumData.self)
        
        if  data.count != 0{
            responseHandler(.success(data))
        }else{
            responseHandler(.failure(RuntimeError.NoRealmSet("Data can not retrieve")))
        }
    }
    
    
}
