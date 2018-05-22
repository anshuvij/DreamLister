//
//  ImageValue+CoreDataProperties.swift
//  DreamLister
//
//  Created by Anshu Vij on 23/05/18.
//  Copyright © 2018 Anshu Vij. All rights reserved.
//
//

import Foundation
import CoreData


extension ImageValue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageValue> {
        return NSFetchRequest<ImageValue>(entityName: "ImageValue")
    }

    @NSManaged public var image: NSObject?
    @NSManaged public var toItem: ItemValue?
    @NSManaged public var toStore: NSSet?

}

// MARK: Generated accessors for toStore
extension ImageValue {

    @objc(addToStoreObject:)
    @NSManaged public func addToToStore(_ value: StoreValue)

    @objc(removeToStoreObject:)
    @NSManaged public func removeFromToStore(_ value: StoreValue)

    @objc(addToStore:)
    @NSManaged public func addToToStore(_ values: NSSet)

    @objc(removeToStore:)
    @NSManaged public func removeFromToStore(_ values: NSSet)

}
