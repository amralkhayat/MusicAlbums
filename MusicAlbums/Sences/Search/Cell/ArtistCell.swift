//
//  ArtistCell.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import UIKit
import AlamofireImage
class ArtistCell: UITableViewCell {

    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var artistName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }

}
extension ArtistCell: ArtistCellView {
    func displayCellBody(artist: Artist) {
        artistName.text = artist.name
    }
    
    
}
