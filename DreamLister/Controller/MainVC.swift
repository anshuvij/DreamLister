//
//  ViewController.swift
//  DreamLister
//
//  Created by Anshu Vij on 23/05/18.
//  Copyright © 2018 Anshu Vij. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController,UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate {
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var controller : NSFetchedResultsController<ItemValue>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
        
       // generateTestData()
        attemptFetch()
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        configureCell(cell: cell, indexpath: indexPath as NSIndexPath)
        
        return cell
    }
    
    func configureCell (cell : ItemCell, indexpath : NSIndexPath)
    {
        let item = controller.object(at: indexpath as IndexPath)
        cell.configureCell(item: item)
        // update cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let sections = controller.sections
        {
            let sectioninfo = sections[section]
            return sectioninfo.numberOfObjects
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if let sections = controller.sections
        {
            return sections.count
        }
        
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func attemptFetch ()
    {
        let fetchRequest : NSFetchRequest<ItemValue> = ItemValue.fetchRequest()
        let dateSort =  NSSortDescriptor(key:"created", ascending : false)
        fetchRequest.sortDescriptors = [dateSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = self
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
        
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.beginUpdates()
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath
            {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case .delete:
            if let indexPath = indexPath
            {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case .update :
            if let indexPath = indexPath
            {
                let cell = tableView.cellForRow(at: indexPath) as! ItemCell
                //update a cell data
                configureCell(cell: cell, indexpath: indexPath as NSIndexPath)
            }
            break
        case .move :
            if let indexPath = indexPath
            {
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            }
            if let indexPath = newIndexPath
            {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
            
            
        }
        
    }
    
    func generateTestData ()
    {
        let item = ItemValue(context: context)
        item.title = "MacBook Pro"
        item.price = 1800
        item.details = "I can't wait until the September event, I really hope they release new MBPs"
        
        let item2 = ItemValue(context: context)
        item2.title = "Bose Headphones"
        item2.price = 300
        item2.details = "But man, it's so nice to block what others are saying with noise canceling tech"
        
        let item3 = ItemValue(context: context)
        item3.title = "Tesla Model S"
        item3.price = 11000
        item3.details = "Oh man this is a beautiful car and one day I will own it"
        
        ad.saveContext()
        
    }
    
    
    
    
    
    
    
    

}

