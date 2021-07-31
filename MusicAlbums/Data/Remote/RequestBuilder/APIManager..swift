//
//  APIManager..swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import Foundation
import Alamofire
protocol APIManagersMethods {
    typealias CallResponse<T> = ((Result<T?, BaseError>) -> Void)

    func performRequest<T>(_ object: T.Type, router: UrlRequestBuilder,
                                  responseHandler:@escaping CallResponse<T> ) where T: Decodable

}

   struct APIManager: APIManagersMethods {
       
     var sessionManager : Session
    
    init(session: Session = Session.default) {
        self.sessionManager =  session
    }
    

     func performRequest<T>(_ object: T.Type, router: UrlRequestBuilder,
                                  responseHandler: @escaping CallResponse<T>) where T: Decodable {
            
        sessionManager.request(router).responseJSON { (response) in
                // ALAMOFIRE ERROR CHECK
                if let error = response.error {
                    responseHandler(.failure(BaseError.serverConnection))
                    print("error on request responce : \(error.localizedDescription)")
                    return
                }
                switch response.response?.statusCode ?? 0 {
                case 404...405:
                    responseHandler(.failure(BaseError.invalidRequest))
                case 500...599:
                    responseHandler(.failure(BaseError.serverError))
                default: break
                }
                do {
                    let data = try JSONDecoder().decode(T.self, from: response.data!)
                        responseHandler(.success(data))
                }catch let error  {
                    responseHandler(.failure(BaseError.unknownError(text: error.localizedDescription.description)))
                }
            }.resume()
    }

}
