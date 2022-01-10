//
//  HelperMethods.swift
//  MusicAlbumsTests
//
//  Created by Amr Saeed on 05/08/2021.
//

import Foundation
@testable import MusicAlbums
typealias CallResponseTest<T> = ((Result<T?, BaseError>) -> Void)
func decodingData<T>(object: T.Type,fileResourece: String, responseHandler:@escaping CallResponseTest<T>) where T: Decodable{
    guard let path =  Bundle.main.path(forResource: fileResourece, ofType: "json")
    else {fatalError("Can't find search.json file")}

    let url = URL(fileURLWithPath: path)
    //When
    do {
    let jsonData = try Data(contentsOf: url)
    let data = try JSONDecoder().decode(T.self,from:jsonData)
        responseHandler(.success(data))
     } catch let error  {
        responseHandler(.failure(BaseError.unknownError(text: error.localizedDescription)))
    }
}

