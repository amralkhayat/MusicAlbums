//
//  UIViewController+Extension.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 30/07/2021.
//

import Foundation
import UIKit
var vSpinner : UIView?
extension UIViewController {
    class var identifier: String{
        return String(describing: self)
    }
    // show spinner
    func showSpinner(onView: UIView) {
      let spinnerView = UIView.init(frame: onView.bounds)
       spinnerView.backgroundColor = UIColor.clear
     if #available(iOS 13.0, *) {
       let activity = UIActivityIndicatorView.init(style: .large)
            activity.startAnimating()
            activity.center = spinnerView.center
            activity.color = UIColor.gray
            DispatchQueue.main.async {
            spinnerView.addSubview(activity)
            }
     } else {
       // Fallback on earlier versions
       let activity = UIActivityIndicatorView.init(style: .whiteLarge)
          activity.startAnimating()
          activity.center = spinnerView.center
          activity.color = UIColor.gray
           DispatchQueue.main.async {
           spinnerView.addSubview(activity)
           }
     }
      onView.addSubview(spinnerView)
        vSpinner = spinnerView
   }
// Remove spinner from View
       func removeSpinner() {
           DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
           }
       }
    
    
    func presentAlert(withTitle title: String, message : String, actions : [String: UIAlertAction.Style] , completionHandler: ((UIAlertAction) -> ())? = nil) {

           let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

           for action in actions {

               let action = UIAlertAction(title: action.key, style: action.value) { action in

                   if completionHandler != nil {
                       completionHandler!(action)
                   }
               }

               alertController.addAction(action)
           }

           self.present(alertController, animated: true, completion: nil)
       }
    
}
