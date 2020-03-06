//
//  ListController.swift
//  ShoppingList
//
//  Created by Kelsey Sparkman on 3/6/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import Foundation
import CoreData

class ListController {
        
    //Properties
    static let shared = ListController()
    var fetchedResultsController: NSFetchedResultsController <List>
    
    init() {
        
        let fetchRequest: NSFetchRequest<List> = List.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        let resultsController: NSFetchedResultsController<List> = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.contextMOC, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController = resultsController
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("There was a really bad error, man.", error.localizedDescription)
        }
    }
    
    //CRUD
    func create(text: String) {
        let _ = List(title: text)
        saveToPersistentStore()
    }
    
    func update(withList list: List, title: String){
        list.title = title
        saveToPersistentStore()
    }
    
    func delete(list: List) {
        CoreDataStack.contextMOC.delete(list)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.contextMOC.save()
        } catch {
            print("There was an error saving the detail! \(#function) \(error.localizedDescription)")
        }
    }
    
    func toggleCheckBox(for list: List) {
        list.isComplete = !list.isComplete
    }
}//End of Class



