//
//  Configuration.swift
//  ScannerPlus
//
//  Created by TuanNM on 12/22/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit

class Configuration: NSObject {
    static let shareInstance = Configuration()

    fileprivate func setUserDefault(key:String,value:String){
        UserDefaults.standard.set(value, forKey: key)
    }
    fileprivate func getUserDefault(key:String)->String?{
        let value = UserDefaults.standard.string(forKey: key)
        return value
    }
}
