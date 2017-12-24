//
//  ExpandView.swift
//  ScannerPlus
//
//  Created by Nguyen Manh Tuan on 12/25/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit
import LiquidFloatingActionButton

class ExpandView: UIView {
    var expandBtn: LiquidFloatingActionButton!
    var cells: [LiquidFloatingCell] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        expandBtn = LiquidFloatingActionButton(frame: bounds)
        expandBtn.animateStyle = .up
        expandBtn.delegate = self
        expandBtn.dataSource = self
        expandBtn.color = UIColor.red
        
        cells.append(LiquidFloatingCell(icon: #imageLiteral(resourceName: "camera")))
        cells.append(LiquidFloatingCell(icon: #imageLiteral(resourceName: "photo")))
        cells.append(LiquidFloatingCell(icon: #imageLiteral(resourceName: "search")))
        
        addSubview(expandBtn)
        backgroundColor = UIColor.clear
    }
    
}

extension ExpandView : LiquidFloatingActionButtonDelegate,LiquidFloatingActionButtonDataSource{
    func numberOfCells(_ liquidFloatingActionButton: LiquidFloatingActionButton) -> Int {
        return cells.count
    }
    
    func cellForIndex(_ index: Int) -> LiquidFloatingCell {
        return cells[index]
    }
    
    func liquidFloatingActionButton(_ liquidFloatingActionButton: LiquidFloatingActionButton, didSelectItemAtIndex index: Int) {
        expandBtn.close()
    }
}
