//
//  CellInterface.swift
//  ScannerPlus
//
//  Created by TuanNM on 12/25/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit

protocol CellInterface {
    static var id:String {get}
    static var cellNib:UINib {get}
}

extension CellInterface{
    static var id : String{
        // get class name
        return String(describing: self)
    }
    
    static var cellNib: UINib {
        // get nib by class name
        return UINib(nibName: id, bundle: nil)
    }
}
