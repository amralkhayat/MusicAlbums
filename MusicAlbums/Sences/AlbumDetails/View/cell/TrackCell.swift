//
//  AlbumDetailsCell.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 01/08/2021.
//

import UIKit

class TrackCell: UITableViewCell {
    //MARK:- IBOUTLETS
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var trackDuration: UILabel!

}


extension TrackCell: TracksCellView {
    func displayCellBody(tracks: Track) {
        trackName.text = tracks.name
        trackDuration.text =  tracks.duration.calculateDuration()
    }
    
 
  
    
}
