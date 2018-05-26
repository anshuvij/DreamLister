//
//  ItemCell.swift
//  DreamLister
//
//  Created by Anshu Vij on 25/05/18.
//  Copyright © 2018 Anshu Vij. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var title: UILabel!
    
    
    func configureCell (item : ItemValue)
    {
        title.text = item.title
        price.text = "$\(item.price)"
        detail.text = item.details
    }
    
    
}
