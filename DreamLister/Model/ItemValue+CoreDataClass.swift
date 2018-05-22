//
//  ItemValue+CoreDataClass.swift
//  DreamLister
//
//  Created by Anshu Vij on 23/05/18.
//  Copyright © 2018 Anshu Vij. All rights reserved.
//
//

import Foundation
import CoreData


public class ItemValue: NSManagedObject {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
    }
    
}
