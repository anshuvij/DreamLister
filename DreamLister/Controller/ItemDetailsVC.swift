//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Anshu Vij on 25/05/18.
//  Copyright © 2018 Anshu Vij. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var storePicker : UIPickerView!
    @IBOutlet weak var titleField : CustomTextField!
    @IBOutlet weak var priceField : CustomTextField!
    @IBOutlet weak var detailsField : CustomTextField!
    
    var stores = [StoreValue]()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        if let topItem = self.navigationController?.navigationBar.topItem
        {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        storePicker.delegate = self
        storePicker.dataSource = self
        
//        let store = StoreValue(context : context)
//        store.name = "Best Buy"
//        let store2 = StoreValue(context : context)
//        store2.name = "Tesla Dealrships"
//        let store3 = StoreValue(context : context)
//        store3.name = "Amazon"
//        let store4 = StoreValue(context : context)
//        store4.name = "K Mart"
//        let store5 = StoreValue(context : context)
//        store5.name = "Target"
//        let store6 = StoreValue(context : context)
//        store6.name = "Flipkart"
        
       // ad.saveContext()
        getStores()
    }

   
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
         let store = stores[row]
        return store.name
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // upadte when selected
    }
    
    func getStores()
    {
        let fetchRequest : NSFetchRequest<StoreValue> = StoreValue.fetchRequest()
        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        } catch {
            // handle error
        }
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        
        let item = ItemValue(context: context)
        if let title = titleField.text {
            item.title = title
        }
        if let price = priceField.text {
            item.price = (price as NSString).doubleValue
            
        }
        if let details = detailsField.text {
            item.details = details
        }
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        ad.saveContext()
        navigationController?.popViewController(animated: true)
        
    }
    
}
