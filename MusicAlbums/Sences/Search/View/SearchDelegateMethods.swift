//
//  SearchDelegateMethods.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import UIKit
extension Search: SearchViewProtocol {
    func tableviewReload() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.searchTableView.reloadData()
        }
    }
    
    func showError(message: String) {
        self.presentAlert(withTitle: "Error", message: message, actions: ["Ok" : UIAlertAction.Style.default])
    }
    
    func showPlacehoder(status: Bool, message: String) {
        let placeholder = CustomPlaceholder()
         placeholder.placeholderLabel.text = message
     
        if status{
            searchTableView.backgroundView =  placeholder
        }else {
            searchTableView.backgroundView = nil
        }
    }



}
