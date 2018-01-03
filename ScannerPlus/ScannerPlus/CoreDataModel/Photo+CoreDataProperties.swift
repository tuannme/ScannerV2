//
//  Item+CoreDataProperties.swift
//  
//
//  Created by nguyen.manh.tuanb on 1/3/18.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var createDate: NSDate?
    @NSManaged public var image: NSData?
    @NSManaged public var name: String?
    @NSManaged public var located: Folder?

}
