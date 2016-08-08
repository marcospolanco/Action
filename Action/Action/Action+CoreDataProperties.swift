//
//  Action+CoreDataProperties.swift
//  Action
//
//  Created by Marcos Polanco on 8/7/16.
//  Copyright © 2016 Fanatize. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Action {

    @NSManaged var created: NSDate?
    @NSManaged var dueDate: NSDate?
    @NSManaged var comments: String?
    @NSManaged var user: NSManagedObject?
    @NSManaged var actions: NSSet?
    @NSManaged var parent: Action?

}
