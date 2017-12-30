//
//  AppDelegate.swift
//  ScannerPlus
//
//  Created by TuanNM on 12/14/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = sb.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let menuVC = sb.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        let nvc = UINavigationController(rootViewController: mainVC)
        nvc.setNavigationBarHidden(true, animated: false)
        let slideMenuController = MainViewController(mainViewController: nvc, leftMenuViewController:  menuVC)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        self.window?.rootViewController = slideMenuController
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

