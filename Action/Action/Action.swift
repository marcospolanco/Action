//
//  Action.swift
//  Action
//
//  Created by Marcos Polanco on 8/7/16.
//  Copyright © 2016 Fanatize. All rights reserved.
//

import Foundation
import CoreData

class Action: NSManagedObject {
    static let name = "Action"
    
    convenience init() {
        //FIX - vulnerable pair of force unwraps...remove
        let context = AppDelegate.sharedAppDelegate!.dataStack.mainContext
        let entity = NSEntityDescription.entityForName(Action.name, inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.created = NSDate()
        self.dueDate = NSDate()
        self.comments = ""
    }
}
