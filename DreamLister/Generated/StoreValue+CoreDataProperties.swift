//
//  StoreValue+CoreDataProperties.swift
//  DreamLister
//
//  Created by Anshu Vij on 23/05/18.
//  Copyright © 2018 Anshu Vij. All rights reserved.
//
//

import Foundation
import CoreData


extension StoreValue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoreValue> {
        return NSFetchRequest<StoreValue>(entityName: "StoreValue")
    }

    @NSManaged public var name: String?
    @NSManaged public var toItem: NSSet?
    @NSManaged public var toImage: ImageValue?

}

// MARK: Generated accessors for toItem
extension StoreValue {

    @objc(addToItemObject:)
    @NSManaged public func addToToItem(_ value: ItemValue)

    @objc(removeToItemObject:)
    @NSManaged public func removeFromToItem(_ value: ItemValue)

    @objc(addToItem:)
    @NSManaged public func addToToItem(_ values: NSSet)

    @objc(removeToItem:)
    @NSManaged public func removeFromToItem(_ values: NSSet)

}
