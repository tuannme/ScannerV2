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

    enum AppColor:String {
        case Dark = "Dark"
        case Light = "Light"
    }
    
    func getAppColor() -> AppColor{
        let color = getUserDefault(key: Constant.AppColor)
        return color == AppColor.Dark.rawValue ? AppColor.Dark : AppColor.Light
    }
    
    func setAppColor(color:AppColor){
        setUserDefault(key: Constant.AppColor, value: color.rawValue)
    }
    
    fileprivate func setUserDefault(key:String,value:String){
        UserDefaults.standard.set(value, forKey: key)
    }
    fileprivate func getUserDefault(key:String)->String?{
        let value = UserDefaults.standard.string(forKey: key)
        return value
    }
}
