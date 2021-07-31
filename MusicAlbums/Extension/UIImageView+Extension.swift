//
//  UIImageView+Extension.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 30/07/2021.
//

import UIKit
import Alamofire
import AlamofireImage
extension UIImageView {
    func loadImage(_ urlImage: String){
        guard let url = URL(string: urlImage) else {return}
        
        self.af.setImage(withURL:url, cacheKey: urlImage)
       
    }
}
