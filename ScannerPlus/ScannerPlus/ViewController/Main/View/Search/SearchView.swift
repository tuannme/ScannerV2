//
//  SearchView.swift
//  ScannerPlus
//
//  Created by TuanNM on 12/25/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit

class SearchView: BaseViewCustom,CellInterface {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func setupView() {
        searchBar.layer.borderColor = UIColor.clear.cgColor
        searchBar.backgroundImage = UIImage()
    }

}
