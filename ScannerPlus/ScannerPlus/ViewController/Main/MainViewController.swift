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
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
