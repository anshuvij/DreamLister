//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Anshu Vij on 25/05/18.
//  Copyright © 2018 Anshu Vij. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var storePicker : UIPickerView!
    @IBOutlet weak var titleField : CustomTextField!
    @IBOutlet weak var priceField : CustomTextField!
    @IBOutlet weak var detailsField : CustomTextField!
    
    @IBOutlet weak var thumbImage: UIImageView!
    
    var stores = [StoreValue]()
    var itemToEdit : ItemValue?
    var imagePicker : UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        if let topItem = self.navigationController?.navigationBar.topItem
        {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        storePicker.delegate = self
        storePicker.dataSource = self
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
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
        
        if itemToEdit != nil {
            loadItemData()
        }
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
        
       
        var item : ItemValue!
        let picture = ImageValue(context : context)
        picture.image = thumbImage.image
        
       
        if  itemToEdit == nil
        {
              item = ItemValue(context: context)
        }
        else
        {
            item = itemToEdit
        }
         item.toImage = picture
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
    
    func loadItemData()
    {
        if let item = itemToEdit {
            titleField.text = item.title
            priceField.text = "\(String(describing: item.price))"
            detailsField.text = item.details
            thumbImage.image = item.toImage?.image as? UIImage
            if let store = item.toStore {
                var index = 0
                repeat {
                    let s = stores[index]
                    if s.name == store.name
                    {
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                    }
                    index += 1
                } while index < stores.count
            }
        }
    }
    
    
    @IBAction func deletePressed(_ sender: UIBarButtonItem) {
        
        if itemToEdit != nil
        {
            context.delete(itemToEdit!)
            ad.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addImage(_ sender: UIButton) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            thumbImage.image = image
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
