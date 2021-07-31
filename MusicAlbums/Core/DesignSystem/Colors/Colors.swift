//
//  Colors.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import UIKit
extension DesignSystem {
    enum Colors: String {
        case primaryColor = "PrimaryColor"
        case secondPrimary = "SecondColor"
        var color: UIColor{
            return UIColor(named: self.rawValue) ?? .white
        }
    }
}
