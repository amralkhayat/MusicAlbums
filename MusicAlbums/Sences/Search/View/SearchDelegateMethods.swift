//
//  SearchDelegateMethods.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import UIKit
extension Search: SearchViewProtocol {
 
    
    func showIndecator() {
        
    }
    
    func hideIndecator() {
        
    }
    
    func tableviewReload() {
        searchTableView.reloadData()
        
    }
    
    func showError(message: String) {
        
    }
    
    func showPlacehoder(status: Bool) {
        let placeholder = CustomPlaceholder()
         placeholder.placeholderLabel.text = "Search for Artist you Love"
     
        if status{
            searchTableView.backgroundView =  placeholder
        }else {
            searchTableView.backgroundView = nil
        }
    }



}
