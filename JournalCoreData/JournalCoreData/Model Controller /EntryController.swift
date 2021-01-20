//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Dennis High on 1/18/21.
//

import CoreData


class EntryController {
    
    // shared instance
    
    static let shared = EntryController()
    
    // SOT
    
    var journals: [Journal] = []
    
    private lazy var fetchRequest: NSFetchRequest<Journal> = {
     let request = NSFetchRequest<Journal>(entityName: "Journal")
     request.predicate = NSPredicate(value: true)
     return request
    }()
    
    
    // MARK: - CRUD
    // MARK: - Create
    func createEntry(title: String, body: String) {
        Journal( title: title, bodyText: body, timeStamp: Date())
        CoreDataStack.saveContext()
    }
    
    
  
        
    // MARK: - READ
    func fetchEntry() {
        self.journals = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    // MARK: - Update
    func updateEntry(journal: Journal, title: String, body: String) {
        journal.title = title
        journal.bodyText = body
        CoreDataStack.saveContext()
        
    }
    
    // MARK: - Delete
    
    func deleteEntry(entryToDelete: Journal) {
        guard let indexToDelete = journals.firstIndex(of: entryToDelete) else { return }
        journals.remove(at: indexToDelete)
        CoreDataStack.saveContext()
    }
    
    // MARK: -
} // END of Class

