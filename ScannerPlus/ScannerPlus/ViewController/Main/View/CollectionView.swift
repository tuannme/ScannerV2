//
//  CollectionView.swift
//  ScannerPlus
//
//  Created by TuanNM on 12/25/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit
import DisplaySwitcher

class CollectionView: UICollectionView {

    override func awakeFromNib() {
        super.awakeFromNib()
        register(DocumentItemCell.cellNib, forCellWithReuseIdentifier: DocumentItemCell.id)
        register(SearchView.cellNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: SearchView.id)
    }

}

