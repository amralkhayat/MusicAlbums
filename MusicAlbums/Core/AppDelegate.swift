//
//  AppDelegate.swift
//  MusicAlbums
//
//  Created by Amr Saeed on 29/07/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
   var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      mainScreenView()
        return true
    }
    
    private func mainScreenView(){
        window = UIWindow()
        let mainScreenViewController = Albums()
        let rootView = UINavigationController(rootViewController: mainScreenViewController )
        rootView.navigationBar.barTintColor =  DesignSystem.Colors.primaryColor.color
        rootView.navigationBar.tintColor = .white
        rootView.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        rootView.navigationBar.prefersLargeTitles = true
        rootView.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        window?.rootViewController =  rootView
        window?.makeKeyAndVisible()
    }
    
    
    
    
}

