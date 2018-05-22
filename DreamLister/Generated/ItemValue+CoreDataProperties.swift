//
//  ItemValue+CoreDataProperties.swift
//  DreamLister
//
//  Created by Anshu Vij on 23/05/18.
//  Copyright © 2018 Anshu Vij. All rights reserved.
//
//

import Foundation
import CoreData


extension ItemValue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemValue> {
        return NSFetchRequest<ItemValue>(entityName: "ItemValue")
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var details: String?
    @NSManaged public var title: String?
    @NSManaged public var price: Double
    @NSManaged public var toImage: ImageValue?
    @NSManaged public var toItemType: ItemTypeValue?
    @NSManaged public var toStore: StoreValue?

}
