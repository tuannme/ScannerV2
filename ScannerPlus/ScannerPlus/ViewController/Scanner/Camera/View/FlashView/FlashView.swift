//
//  FlashView.swift
//  ScannerPlus
//
//  Created by Nguyen Manh Tuan on 12/29/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit

class FlashView: UIView {

    var flashAction:((_ flash:Bool)->())?
    
    fileprivate var isFlash = false
    fileprivate let flashImv = UIImageView(image: #imageLiteral(resourceName: "flash_off"))
    override init(frame: CGRect) {
        super.init(frame: frame)
        settingView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func settingView(){
        flashImv.frame = CGRect(x: bounds.width / 2 - 15, y: bounds.width / 2 - 15, width: 30, height: 30)
        addSubview(flashImv)
        
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(didTapFlash))
        isUserInteractionEnabled = true
        addGestureRecognizer(tapGes)
    }
    
    @objc func didTapFlash(){
        isFlash = !isFlash
        flashImv.image = isFlash ? #imageLiteral(resourceName: "flash_on") : #imageLiteral(resourceName: "flash_off")
        flashAction?(isFlash)
    }

}
