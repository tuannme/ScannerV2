//
//  MainViewController.swift
//  ScannerPlus
//
//  Created by TuanNM on 12/22/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    
    @IBOutlet weak var navigationBar: NavigationCustom!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.config(leftBtnImage: nil, rightBtnImage: nil, leftBtnTitle: "Close", rightBtnTitle: "Edit", title: "Scanner +")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("MainViewController didReceiveMemoryWarning")
    }
}

