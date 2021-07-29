//
//  Search.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import UIKit

class Search: UIViewController {
    
    //MARK:- IBOUTLETS
    @IBOutlet weak var searchTableView: UITableView! {
        didSet{
            searchTableView.rowHeight =  70
            searchTableView.tableFooterView =  UIView()
            searchTableView.registerCellNib(cellClass: ArtistCell.self)
            searchTableView.dataSource = self
        }
    }
    //MARK:- Properties
    var presenter:SearchVCPresenter?
    let searchController :UISearchController = {
     let searchController =  UISearchController()
        searchController.searchBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchController.searchBar.searchTextField.leftView?.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    return searchController
    }()
    
    

    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController =  searchController
        navigationItem.title = "Search"
        SearchRouter.searchRouterVC(view: self)
        presenter?.viewDidLoad()
        
    }
    //MARK:- Helper

    //MARK:- Selector

}




extension Search: UITableViewDataSource,SearchViewProtocol {
    func showIndecator() {
        
    }
    
    func hideIndecator() {
        
    }
    
    func tableviewReload() {
        
    }
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeue() as ArtistCell
        return cell
    }


}
