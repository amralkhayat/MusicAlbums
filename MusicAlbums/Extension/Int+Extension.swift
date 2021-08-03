//
//  String+Extension.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 03/08/2021.
//

import UIKit

extension Int {
    func calculateDuration() -> String{
     return String(self / 60)
    }
    
    func calculateTotalDutation () -> String {
      let (h,m,s) =   (self / 3600, (self % 3600) / 60, (self % 3600) % 60)
       return  "\(h) Hours,\(m) Minutes,\(s) Seconds"
    }
    
}
