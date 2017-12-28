//
//  MainViewController.swift
//  ScannerPlus
//
//  Created by TuanNM on 12/22/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit
import DisplaySwitcher

private let animationDuration: TimeInterval = 0.3
private let listLayoutStaticCellHeight: CGFloat = 80
private let gridLayoutStaticCellHeight: CGFloat = 165

class MainViewController: BaseViewController {
    
   @IBOutlet fileprivate weak var navigationBar: NavigationCustom!
   @IBOutlet fileprivate weak var collectionView: CollectionView!

    fileprivate var listLayout = DisplaySwitchLayout(staticCellHeight: listLayoutStaticCellHeight, nextLayoutStaticCellHeight: gridLayoutStaticCellHeight, layoutState: .list)
    fileprivate var gridLayout = DisplaySwitchLayout(staticCellHeight: gridLayoutStaticCellHeight, nextLayoutStaticCellHeight: listLayoutStaticCellHeight, layoutState: .grid)
    fileprivate var layoutState: LayoutState = .list
    fileprivate var isTransitionAvailable = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.config(leftBtnImage: "menu", rightBtnImage: "grid", leftBtnTitle: nil, rightBtnTitle: nil, title: "Scanner +")
        collectionView.collectionViewLayout = listLayout
 
        navigationBar.addRightAction = {
            if !self.isTransitionAvailable {
                return
            }
            let transitionManager: TransitionManager
            if self.layoutState == .list {
                self.layoutState = .grid
                transitionManager = TransitionManager(duration: animationDuration, collectionView: self.collectionView, destinationLayout: self.gridLayout, layoutState: self.layoutState)
            } else {
                self.layoutState = .list
                transitionManager = TransitionManager(duration: animationDuration, collectionView: self.collectionView, destinationLayout: self.listLayout, layoutState: self.layoutState)
            }
            transitionManager.startInteractiveTransition()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("MainViewController didReceiveMemoryWarning")
    }
}

extension MainViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DocumentItemCell.id, for: indexPath) as! DocumentItemCell
        if layoutState == .grid {
            cell.setupGridLayoutConstraints(1, cellWidth: cell.frame.width)
        } else {
            cell.setupListLayoutConstraints(1, cellWidth: cell.frame.width)
        }
        let document = DocumentItem()
        cell.bind(document)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: SearchView.id, for: indexPath)
        headerView.frame.size.height = 60
        return headerView
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
        view.endEditing(true)
    }
}

