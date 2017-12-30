//
//  MainViewController.swift
//  ScannerPlus
//
//  Created by Nguyen Manh Tuan on 12/28/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class MainViewController: SlideMenuController {

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func isTagetViewController() -> Bool {
        if let vc = UIApplication.topViewController() {
            if vc is HomeViewController{
                return true
            }
        }
        return false
    }
}
