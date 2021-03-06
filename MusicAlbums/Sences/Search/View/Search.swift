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
//            searchTableView.rowHeight =  70
            searchTableView.tableFooterView =  UIView()
            searchTableView.registerCellNib(cellClass: ArtistCell.self)
            searchTableView.dataSource = self
            searchTableView.delegate = self
            searchTableView.prefetchDataSource = self
        }
    }
    //MARK:- Properties
    var presenter:SearchVCPresenter?
    let searchController :UISearchController = {
    let searchCont =  UISearchController()
        searchCont.searchBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchCont.searchBar.searchTextField.leftView?.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchCont.searchBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchCont.searchBar.searchTextField.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchCont.searchBar.searchTextField.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchCont.searchBar.returnKeyType = .done
        searchCont.obscuresBackgroundDuringPresentation = false
        searchCont.searchBar.enablesReturnKeyAutomatically = false
        searchCont.obscuresBackgroundDuringPresentation = false
        searchCont.definesPresentationContext = true
    return searchCont
    }()
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchController.searchBar.text = nil
    }
    //MARK:- Helper
    private func configurationUI(){
        navigationItem.searchController =  searchController
        navigationItem.title = "Search"
        SearchRouter.searchRouterVC(view: self)
        presenter?.viewDidLoad()
        searchBarProperties()
    }
    private func searchBarProperties(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string:"Search", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
}
//MARK:- Search Methods
extension Search: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return }
        presenter?.search(artist: text)
    }
}

//MARK:- Table view delegate and data source methods 
extension Search: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeue() as ArtistCell
        presenter?.configurationArtistCell(cell: cell, index: indexPath.row)
        return cell
    }

 }
extension Search: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didselectCell(index: indexPath.row)
    }
}

extension Search: UITableViewDataSourcePrefetching{
  func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
    presenter?.prefetchRowsAt(indexPath: indexPaths)
  }

}
