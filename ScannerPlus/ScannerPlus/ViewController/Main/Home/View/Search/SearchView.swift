//
//  SearchView.swift
//  ScannerPlus
//
//  Created by TuanNM on 12/25/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit

class SearchView: BaseViewCustom {

    var searchAction : ((_ keyword:String) -> ())?
    @IBOutlet fileprivate weak var searchBar: UISearchBar!
    
    override func setupView() {
        super.setupView()

        searchBar.layer.borderColor = UIColor.clear.cgColor
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        searchBar.placeholder = "Search"
    }
}

extension SearchView : UISearchBarDelegate{

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = searchBar.text else{return}
        searchAction?(keyword)
        searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchAction?(searchText)
    }

}
