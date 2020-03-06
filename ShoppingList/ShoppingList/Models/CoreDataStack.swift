//
//  CoreDataStack.swift
//  ShoppingList
//
//  Created by Kelsey Sparkman on 3/6/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ShoppingList")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent stores \(error)")
            }
        }
        return container
    }()
    
    static var contextMOC: NSManagedObjectContext {
        return container.viewContext
    }
}

