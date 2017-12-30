//
//  CloseView.swift
//  ScannerPlus
//
//  Created by Nguyen Manh Tuan on 12/30/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit

class CloseView: UIView {

    var closeAction:(()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        settingView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func settingView(){
        let closeImv = UIImageView(image: #imageLiteral(resourceName: "close"))
        closeImv.frame = CGRect(x: bounds.width / 2 - 15, y: bounds.width / 2 - 15, width: 30, height: 30)
        addSubview(closeImv)
        
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        isUserInteractionEnabled = true
        addGestureRecognizer(tapGes)
    }
    
    @objc func tapAction(){
        closeAction?()
    }

}
