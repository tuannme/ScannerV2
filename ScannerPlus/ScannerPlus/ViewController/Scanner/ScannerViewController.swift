//
//  ScannerViewController.swift
//  ScannerPlus
//
//  Created by Nguyen Manh Tuan on 12/29/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit

class ScannerViewController: CameraViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCamera()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startCamera()
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
