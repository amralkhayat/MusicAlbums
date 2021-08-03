//
//  AlbumDetails.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import UIKit

class AlbumDetails: UIViewController {

    
    //MARK:- IBOUTLETS

    @IBOutlet weak var albumDetailsTableView: UITableView!{
        didSet{
            albumDetailsTableView.delegate = self
            albumDetailsTableView.dataSource = self
            albumDetailsTableView.rowHeight =  300
            albumDetailsTableView.tableFooterView =  UIView()
            albumDetailsTableView.registerCellNib(cellClass: TrackCell.self)
            albumDetailsTableView.registerCellNib(cellClass: AlbumDetailsHeaderCell.self)
        }
    }
    //MARK:- Properties
    var presenter:AlbumDetailsVcPresnter?
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationUI()
    }
    //MARK:- Helper
    private func configurationUI(){
    }

}
//MARK:- TableView Delegate Methods
   extension  AlbumDetails: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell =  tableView.dequeue() as AlbumDetailsHeaderCell
//        presenter?.configurationAlbumDetailsCell(cell:  headerCell)
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 372
    }

   }
//MARK:- TableView DataSource Methods
  extension AlbumDetails: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
      }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let albumDetailsCell = tableView.dequeue() as TrackCell
//        presenter?.configurationAlbumDetailsCell(cell:  albumDetailsCell)
        return albumDetailsCell

}
  }
