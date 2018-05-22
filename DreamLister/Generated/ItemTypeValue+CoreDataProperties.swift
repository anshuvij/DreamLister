//
//  ItemTypeValue+CoreDataProperties.swift
//  DreamLister
//
//  Created by Anshu Vij on 23/05/18.
//  Copyright © 2018 Anshu Vij. All rights reserved.
//
//

import Foundation
import CoreData


extension ItemTypeValue {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemTypeValue> {
        return NSFetchRequest<ItemTypeValue>(entityName: "ItemTypeValue")
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: ItemValue?

}
