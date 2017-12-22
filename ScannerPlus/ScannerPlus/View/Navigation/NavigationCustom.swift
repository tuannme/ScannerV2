//
//  NavigationCustom.swift
//  ScannerPlus
//
//  Created by TuanNM on 12/22/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit

class NavigationCustom: BaseViewCustom {
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var rightBtn: UIButton!
    var addLeftAction : (() -> ())?
    var addRightAction : (() -> ())?
    
    override func setupView() {
        super.setupView()
        let color = Configuration.shareInstance.getAppColor()
        if color == .Dark{
            backgroundColor = UIColor(hex: "020626")
            let titleColor = UIColor.white
            leftBtn.setTitleColor(titleColor, for: .normal)
            rightBtn.setTitleColor(titleColor, for: .normal)
            titleLb.textColor = titleColor
        }else{
            backgroundColor = UIColor(hex: "ACAAA4")
            let titleColor = UIColor.black
            leftBtn.setTitleColor(titleColor, for: .normal)
            rightBtn.setTitleColor(titleColor, for: .normal)
            titleLb.textColor = titleColor
        }
    }
    
    @IBAction func leftAction(_ sender: Any) {
       addLeftAction?()
    }
    @IBAction func rightAction(_ sender: Any) {
        addRightAction?()
    }
    func config(leftBtnImage:String?,rightBtnImage:String?,leftBtnTitle:String?,rightBtnTitle:String?,title:String?){
        if let leftBtnImage = leftBtnImage{
            leftBtn.setImage(UIImage(named: leftBtnImage), for: .normal)
        }
        if let rightBtnImage = rightBtnImage{
            rightBtn.setImage(UIImage(named: rightBtnImage), for: .normal)
        }
        if let leftBtnTitle = leftBtnTitle{
            leftBtn.setTitle(leftBtnTitle, for: .normal)
        }
        if let rightBtnTitle = rightBtnTitle{
            rightBtn.setTitle(rightBtnTitle, for: .normal)
        }
        if let title = title{
            titleLb.text = title
        }
    }

}
