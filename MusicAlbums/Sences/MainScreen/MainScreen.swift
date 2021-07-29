//
//  MainScreen.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import UIKit

class MainScreen: UIViewController {
    //MARK:- Properties
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    configurationUI()
    }

    //MARK:- Helper
    
    private func configurationUI(){
        navifationBarConfig()
    }
    
    private func navifationBarConfig(){
        
        let searchBarItem =  UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                                            style: .plain, target: self, action: #selector(searchTapped))
        searchBarItem.tintColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationItem.rightBarButtonItem = searchBarItem
        navigationItem.title =  "Albums"

    
    }

    //MARK:- Selector
    @objc func searchTapped () {
      let searchViewController =  Search()
        navigationController?.pushViewController(searchViewController, animated: true)
    }
}
