//
//  BlurEffectView.swift
//  ScannerPlus
//
//  Created by Nguyen Manh Tuan on 12/25/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit

class BlurEffectView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = bounds
        addSubview(blurredEffectView)
        
        let color = Configuration.shareInstance.getAppColor()
        image = color == .Dark ? #imageLiteral(resourceName: "background") : #imageLiteral(resourceName: "background")
    }

}
