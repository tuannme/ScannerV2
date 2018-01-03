//
//  ExpandView.swift
//  ScannerPlus
//
//  Created by Nguyen Manh Tuan on 12/25/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit
import LiquidFloatingActionButton

class ExpandView: LiquidFloatingActionButton {
    
    enum Items:Int {
        case Camera
        case Photo
        case Sort
        case NewFolder
    }

    var didSelecteItem : ((_ item:Items) -> ())?
    fileprivate let cameraCell = LiquidFloatingCell(icon: #imageLiteral(resourceName: "camera"))
    fileprivate let photoCell = LiquidFloatingCell(icon: #imageLiteral(resourceName: "photo"))
    fileprivate let sortCell = LiquidFloatingCell(icon: #imageLiteral(resourceName: "grid"))
    fileprivate let newFolderCell = LiquidFloatingCell(icon: #imageLiteral(resourceName: "new_folder"))
    fileprivate var cells: [LiquidFloatingCell] = []
    fileprivate var isList:Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        cells = [cameraCell,photoCell,sortCell,newFolderCell]
        animateStyle = .up
        dataSource = self
        delegate = self
        color = UIColor.red
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
        liquidFloatingActionButton.close()
        guard let item = Items(rawValue: index) else{return}
        if item == .Sort{
            let image = isList ? #imageLiteral(resourceName: "list") : #imageLiteral(resourceName: "grid")
            isList = !isList
            sortCell.imageView.image = image
        }
        didSelecteItem?(item)
    }
}

