//
//  AlbumDetailsHeaderCell.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 01/08/2021.
//

import UIKit

class AlbumDetailsHeaderCell: UITableViewCell {
    

    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var listeners: UILabel!
    @IBOutlet weak var tracksDuration: UILabel!
    @IBOutlet weak var saveAndDeleteButton: UIButton!
    var tapCallback: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func saveAndDeleteBtnPressed(_ sender: UIButton) {
       tapCallback?()
    }
}

extension AlbumDetailsHeaderCell: HeaderCellView {
  
    func displayCellBody(albumDetails: AlbumData) {
        let album = albumDetails
        albumName.text =  album.name
        artistName.text =  album.artist
        listeners.text = "\(album.listeners ?? "" ) Listeners"
        let totalDuration =  album.tracks?.track.reduce(0, {$0 + ($1.duration ?? 0)})
        tracksDuration.text =  totalDuration?.calculateTotalDutation()
        
    }
    
    func albumIsDownloaded(status: Bool) {
        if status{
            saveAndDeleteButton.setImage(#imageLiteral(resourceName: "downloaded"), for: .normal)
        }else{
            saveAndDeleteButton.setImage(#imageLiteral(resourceName: "undownload"), for: .normal)
        }
    }
    
    
}
