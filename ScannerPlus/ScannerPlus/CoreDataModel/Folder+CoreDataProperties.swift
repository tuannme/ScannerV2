//
//  Folder+CoreDataProperties.swift
//  
//
//  Created by nguyen.manh.tuanb on 1/3/18.
//
//

import Foundation
import CoreData


extension Folder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Folder> {
        return NSFetchRequest<Folder>(entityName: "Folder")
    }

    @NSManaged public var createDate: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var contain: NSSet?

}

// MARK: Generated accessors for contain
extension Folder {

    @objc(addContainObject:)
    @NSManaged public func addToContain(_ value: Item)

    @objc(removeContainObject:)
    @NSManaged public func removeFromContain(_ value: Item)

    @objc(addContain:)
    @NSManaged public func addToContain(_ values: NSSet)

    @objc(removeContain:)
    @NSManaged public func removeFromContain(_ values: NSSet)

}
