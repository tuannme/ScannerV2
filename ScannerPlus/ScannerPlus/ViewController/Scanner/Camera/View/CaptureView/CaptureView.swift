//
//  CaptureView.swift
//  ScannerPlus
//
//  Created by Nguyen Manh Tuan on 12/29/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit

class CaptureView: UIView {

    var captureAction:(()->())?
    var selectedColor = UIColor.blue
    var defaultColor = UIColor.white
    
    fileprivate let circleView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        settingView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func settingView(){
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.width/2
        self.layer.borderColor = defaultColor.withAlphaComponent(0.7).cgColor
        self.layer.borderWidth = 2.5
        self.backgroundColor = UIColor.clear
        
        circleView.frame = CGRect(x: 4, y: 4, width: bounds.width - 8, height: bounds.height - 8)
        circleView.backgroundColor = defaultColor.withAlphaComponent(0.7)
        circleView.layer.cornerRadius = bounds.width/2 - 4
        circleView.clipsToBounds = true
        self.addSubview(circleView)
        
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(capture))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGes)
        
    }
    @objc func capture(){
        captureAction?()
        
        UIView.animate(withDuration: 0.4, animations: {
            self.layer.borderColor = self.selectedColor.withAlphaComponent(0.7).cgColor
            self.circleView.backgroundColor = self.selectedColor.withAlphaComponent(0.7)
        }) { (done) in
            self.layer.borderColor = self.defaultColor.withAlphaComponent(0.7).cgColor
            self.circleView.backgroundColor = self.defaultColor.withAlphaComponent(0.7)
        }
        
    }

}
