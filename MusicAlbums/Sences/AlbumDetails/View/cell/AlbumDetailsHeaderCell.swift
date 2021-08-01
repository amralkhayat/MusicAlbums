//
//  AlbumDetailsHeaderCell.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 01/08/2021.
//

import UIKit

class AlbumDetailsHeaderCell: UITableViewCell {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
}
extension AlbumDetailsHeaderCell: AlbumDetailsCellView {
    func displayCellBody(albumDetails: AlbumDetailsModel) {
        albumImage.loadImage(albumDetails.albumImageUrl ?? "")
        albumName.text = albumDetails.albumName
    }
    
    
}
