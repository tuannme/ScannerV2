//
//  CollectionView.swift
//  ScannerPlus
//
//  Created by TuanNM on 12/25/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit
import DisplaySwitcher

private let animationDuration: TimeInterval = 0.3
private let listLayoutStaticCellHeight: CGFloat = 80
private let gridLayoutStaticCellHeight: CGFloat = 165

class CollectionView: UICollectionView {

    var documentItems:[DocumentItem] = []
    var selectFolderAction:((_ folder:Folder)->())?
    fileprivate var listLayout = DisplaySwitchLayout(staticCellHeight: listLayoutStaticCellHeight, nextLayoutStaticCellHeight: gridLayoutStaticCellHeight, layoutState: .list)
    fileprivate var gridLayout = DisplaySwitchLayout(staticCellHeight: gridLayoutStaticCellHeight, nextLayoutStaticCellHeight: listLayoutStaticCellHeight, layoutState: .grid)
    fileprivate var layoutState: LayoutState = .list
    fileprivate var isTransitionAvailable = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        register(DocumentItemCell.cellNib, forCellWithReuseIdentifier: DocumentItemCell.id)
        collectionViewLayout = listLayout
        dataSource = self
        delegate = self
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        addGestureRecognizer(tapGes)
    }
    
    @objc func didTapView(){
        superview?.endEditing(true)
    }
    
    func sortItem(){
        if !self.isTransitionAvailable || documentItems.count == 0{
            return
        }
        let transitionManager: TransitionManager
        if self.layoutState == .list {
            self.layoutState = .grid
            transitionManager = TransitionManager(duration: animationDuration, collectionView: self, destinationLayout: self.gridLayout, layoutState: self.layoutState)
        } else {
            self.layoutState = .list
            transitionManager = TransitionManager(duration: animationDuration, collectionView: self, destinationLayout: self.listLayout, layoutState: self.layoutState)
        }
        transitionManager.startInteractiveTransition()
    }
    
    func didSelectFolder(index:Int){
        let document = documentItems[index]
        
    }
    
}

extension CollectionView : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return documentItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DocumentItemCell.id, for: indexPath) as! DocumentItemCell
        if layoutState == .grid {
            cell.setupGridLayoutConstraints(1, cellWidth: cell.frame.width)
        } else {
            cell.setupListLayoutConstraints(1, cellWidth: cell.frame.width)
        }
        let document = documentItems[indexPath.row]
        cell.bind(document)
        cell.avatarAction = {
            [weak self] in
            guard let _self = self else{return}
            guard let index = collectionView.indexPath(for: cell)?.row else{return}
            _self.didSelectFolder(index: index)
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
        let customTransitionLayout = TransitionLayout(currentLayout: fromLayout, nextLayout: toLayout)
        return customTransitionLayout
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isTransitionAvailable = false
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        isTransitionAvailable = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        superview?.endEditing(true)
    }
}
