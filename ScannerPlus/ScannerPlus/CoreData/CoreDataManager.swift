//
//  CoreDataManager.swift
//  ScannerPlus
//
//  Created by nguyen.manh.tuanb on 1/3/18.
//  Copyright © 2018 TuanNM. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {

    static let sharedInstance = CoreDataManager()
    let FOLDER = "Folder"
    let PHOTO = "Photo"
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Document")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func createNewFolder(name:String){
        let folderEntity = NSEntityDescription.insertNewObject(forEntityName: FOLDER, into: persistentContainer.viewContext) as! Folder
        folderEntity.createDate = Date()
        folderEntity.name = name
        saveContext()
    }
    
    func createNewPhoto(image:UIImage,name:String,folder:Folder?){
        let photoEntity = NSEntityDescription.insertNewObject(forEntityName: PHOTO, into: persistentContainer.viewContext) as! Photo
        photoEntity.createDate = Date()
        photoEntity.name = name
        photoEntity.data = UIImageJPEGRepresentation(image, 1)
        photoEntity.located = folder
        saveContext()
    }
    
    func fetchFolder()->[Folder]{
        let fetchRequest:NSFetchRequest<Folder> = Folder.fetchRequest()
        do {
            let fetchedEntities:[Folder] = try persistentContainer.viewContext.fetch(fetchRequest)
            return fetchedEntities
        }catch let error{
            print("fetched error : \(error.localizedDescription)")
        }
        return []
    }
    
    func fetchPhotoIn(folder:Folder)->[Photo]{
        if let photos = folder.contain?.allObjects as? [Photo]{
            return photos
        }
        return []
    }
    /*
    func fetchFolder(createDate:Date)->Folder{
        let fetchRequest:NSFetchRequest<Folder> = Folder.fetchRequest()
      
    }
    */
    
    
    
}
