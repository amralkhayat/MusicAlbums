//
//  RealmManager.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 01/08/2021.
//

import RealmSwift
import Foundation
import os.log
protocol RealmManagerMethods {
    typealias CallResponse<T> = ((Result<T?, RuntimeError>) -> Void)
    func create<T:Object> (_ objects: T,responseHandler: @escaping CallResponse<String>)
    func read<R:Object,T>  (_ object: R.Type ,primaryKey:T) -> R?
    func delete <D:Object>( _ object:D,responseHandler: @escaping CallResponse<String>)
    func objectExists<E:Object,T>(_ object:E.Type,primaryKey:T) -> Bool
}


class RealmManager: RealmManagerMethods {
    
    private var realm:Realm!
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    init() {
        realmConfigurations()
    }
    
    
    // Create Relam file, and saved it in  document directory
     private func realmConfigurations(){
         do {
           let realm =  try Realm()
             self.realm =  realm
         } catch{
          
             print(error.localizedDescription)
             print("Unable to create an instance ")
         }
     }
    

    //Write  a list objects to the Realm
    func create<T:Object> (_ objects: T, responseHandler: @escaping CallResponse<String>){
        do {
            try realm?.write{
                realm?.add(objects, update: .modified)
                responseHandler(.success("Data successfully saved"))
            }
        }catch let error as NSError {
            responseHandler(.failure(RuntimeError.NoRealmSet(error.localizedDescription)))
        }
    }
    

    
    
    func read<R, T>(_ object: R.Type, primaryKey: T) -> R? where R : Object {
        return  realm.object(ofType: object, forPrimaryKey: primaryKey)
    }

    
    func delete<D>(_ object: D, responseHandler: @escaping CallResponse<String>) where D : Object {
        
        do{
            try realm.write{
                realm.delete(object)
                responseHandler(.success("Data successfully Deleted"))
            }
        }catch let error as NSError{
            responseHandler(.failure(RuntimeError.NoRealmSet(error.localizedDescription)))
        }
    }
    
    
    func objectExists<E, T>(_ object: E.Type, primaryKey: T) -> Bool where E : Object {

         return realm.object(ofType:  object, forPrimaryKey: primaryKey) != nil
    }
    
    
    
    
    
    

}

enum RuntimeError: Error
{
    case NoRealmSet(_ message: String)
    case saveError
    
    var localizedDescription: String {
        switch self {
        case .NoRealmSet(let message ):
            return message
        case .saveError:
            return ""
        }
        
    }
  
}
