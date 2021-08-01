//
//  AlbumDetailsCell.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 01/08/2021.
//

import UIKit

class AlbumDetailsCell: UITableViewCell {
    //MARK:- IBOUTLETS
    @IBOutlet weak var playAccountLabel: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var saveAndDeleteButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func saveAndDeleteBtnPressed(_ sender: UIButton) {
    }

}


extension AlbumDetailsCell: AlbumDetailsCellView {
    func displayCellBody(albumDetails: AlbumDetailsModel) {
        artistName.text =  albumDetails.artistName
        playAccountLabel.text = "Play Account \(albumDetails.playAccount)"
        
    }
    
    
}
