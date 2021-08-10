//
//  AlbumCell.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 31/07/2021.
//

import UIKit

class AlbumCell: UICollectionViewCell {

    @IBOutlet weak var albumView: AlbumView!
    override func awakeFromNib() {
        super.awakeFromNib()
        albumView.downloadImageAlbum.isHidden = true
    }

}
extension AlbumCell: AlbumCellView {
    func displayCellBody(album: Album) {
        albumView.albumName.text =  album.name
        albumView.albumArtist.text = album.artist.name
        albumView.albumImage.loadImage(album.image[2].text )
    }
}
