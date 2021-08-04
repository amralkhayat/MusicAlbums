//
//  AlbumDetailsViewController.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 02/08/2021.
//

import UIKit

class AlbumDetailsViewController: UIViewController {

    //MARK:- IBOUTLETS

    @IBOutlet weak var albumDetailsTableView: UITableView!{
        didSet{
            albumDetailsTableView.delegate = self
            albumDetailsTableView.dataSource = self
            albumDetailsTableView.rowHeight =  44
            albumDetailsTableView.tableFooterView =  UIView()
            albumDetailsTableView.registerCellNib(cellClass: TrackCell.self)
            albumDetailsTableView.registerCellNib(cellClass: AlbumDetailsHeaderCell.self)
            
        }
    }
    //MARK:- Properties
    var presenter:AlbumDetailsVcPresnter?
    var albumImageUrl = ""
    var headerView: StretchyHeaderView?
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    //MARK:- Helper
    private func configurationUI(){
        presenter?.viewdidLoad()
         headerView = StretchyHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 300))
        self.albumDetailsTableView.tableHeaderView = headerView
        navigationItem.largeTitleDisplayMode = .never
        
    
    }

}
//MARK:- TableView Delegate Methods
   extension  AlbumDetailsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell =  tableView.dequeue() as AlbumDetailsHeaderCell
        presenter?.configurationHeaderCell(cell: headerCell)
        
        headerCell.tapCallback = {
            if self.presenter?.downloadAndDelete() == true {
                headerCell.saveAndDeleteButton.setImage(#imageLiteral(resourceName: "downloaded"), for: .normal)
            }else{
                headerCell.saveAndDeleteButton.setImage(#imageLiteral(resourceName: "undownload"), for: .normal)
            }
            
        }
      
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 140
    }

   }
//MARK:- TableView DataSource Methods
  extension AlbumDetailsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberTracks ?? 0
      }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trackCell = tableView.dequeue() as TrackCell
        presenter?.configurationTracksCellViewCell(cell: trackCell, index: indexPath.row)
    return trackCell
}
  }



extension AlbumDetailsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let headerView = self.albumDetailsTableView.tableHeaderView as! StretchyHeaderView
        headerView.scrollViewDidScroll(scrollView: scrollView)
    }
}


extension AlbumDetailsViewController: AlbumDetailsViewProtocol{
    func showAlbumImage(url: String) {
        DispatchQueue.main.async {
            self.headerView?.imageView.loadImage(url)
         }

    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.albumDetailsTableView.reloadData()
        }
    
    }
    
    func showIndecator() {
        
    }
    
    func hideIndecator() {
        
    }
    
    func show(_ Message: String) {
        
    }
    
    
}
