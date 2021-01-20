//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by Dennis High on 1/18/21.
//

import CoreData


extension Journal {
    
    @discardableResult convenience init(title: String, bodyText: String, timeStamp: Date, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = timeStamp
        
    }
}

extension Journal {
    static func == (lhs: Journal, rhs: Journal) -> Bool {
        lhs.timeStamp == rhs.timeStamp
    }
}
