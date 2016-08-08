//
//  Database.swift
//  Action
//
//  Created by Marcos Polanco on 8/7/16.
//  Copyright © 2016 Fanatize. All rights reserved.
//

import CoreData
import DATAStack

class Database {
    
    static let name = "Action"
    
    //the Database's delegate
    static var delegate: DatabaseDelegate?
    
    //a shortener to find the datastack
    static var dataStack: DATAStack? {
        return AppDelegate.sharedAppDelegate?.dataStack
    }
    
    //return a list of the actions
    static func actions() -> [Action] {
        let request = NSFetchRequest(entityName: Action.name)
        do {
            //load all the actions into the array and return it
            return try self.dataStack?.mainContext.executeFetchRequest(request) as! [Action]
        } catch {
            
            //if we fail, at this point just return an empty list of actions
            return [Action]()
        }
    }
    
    //deletes the given object from the database
    static func delete(object: NSManagedObject) {
        self.dataStack?.mainContext.deleteObject(object)
        self.save()
    }
    
    //save the database; at this time we are just using the main context
    static func save() {
        do {
            try self.dataStack?.mainContext.save()
        } catch {
            self.delegate?.didSave(false)
        }
    }
}

//definitin of the database delegate protocol
protocol DatabaseDelegate {
    func didSave(status: Bool)
}
