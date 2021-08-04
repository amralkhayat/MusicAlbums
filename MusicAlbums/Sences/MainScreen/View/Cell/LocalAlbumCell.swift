//
//  LocalAlbumCell.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 04/08/2021.
//

import UIKit

class LocalAlbumCell: UICollectionViewCell {
    @IBOutlet weak var albumView: AlbumView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }

}
extension LocalAlbumCell: LocalAlbumCellView{
    func displayCellBody(album: AlbumData) {
        albumView.albumArtist.text =  album.artist
        albumView.albumName.text = album.name
        albumView.albumImage.loadImage(album.image[2].text ?? "")
    }
}
