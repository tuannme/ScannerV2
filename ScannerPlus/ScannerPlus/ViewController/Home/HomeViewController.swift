//
//  MainViewController.swift
//  ScannerPlus
//
//  Created by TuanNM on 12/22/17.
//  Copyright © 2017 TuanNM. All rights reserved.
//

import UIKit
import DisplaySwitcher
import LiquidFloatingActionButton
import FCAlertView

class HomeViewController: BaseViewController {
    
    @IBOutlet fileprivate weak var collectionView: CollectionView!
    @IBOutlet fileprivate weak var expandView: ExpandView!
    @IBOutlet fileprivate weak var searchView: SearchView!
    fileprivate var documentItems:[DocumentItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expandView.didSelecteItem = {
             item in
            switch item {
            case .Camera:
                let scannerVC = ScannerViewController()
                scannerVC.view.frame = self.view.bounds
                self.present(scannerVC, animated: true, completion: nil)
                break
            case .Photo:
                break
            case .Sort:
                self.collectionView.sortItem()
                break
            case .NewFolder:
                self.showAlertCreateNewFolder()
                break
            }
        }
        
        searchView.searchAction = {
            keyword in
            self.filterItemsWith(keyword: keyword)
        }
    }
    
    func showAlertCreateNewFolder(){
        let alert = FCAlertView()
        let textFiled = UITextField()
        alert.addTextField(withCustomTextField: textFiled, andPlaceholder: "Enter name") { (folderName) in
            
        }
        alert.showAlert(inView: self,
                        withTitle: "hello",
                        withSubtitle: "hey guys",
                        withCustomImage: #imageLiteral(resourceName: "new_folder"),
                        withDoneButtonTitle: "Done",
                        andButtons: [])
    }
    
    func filterItemsWith(keyword:String){
        var searchResult = documentItems
        if keyword != ""{
            searchResult = searchResult.filter { (item) -> Bool in
                return item.name.contains(keyword)
            }
        }
        collectionView.documentItems = searchResult
        collectionView.reloadData()
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("HomeViewController didReceiveMemoryWarning")
    }
}



