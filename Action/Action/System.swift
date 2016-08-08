//
//  System.swift
//  Action
//
//  Created by Marcos Polanco on 8/8/16.
//  Copyright © 2016 Fanatize. All rights reserved.
//

import Foundation

typealias Threads = NSOperationQueue

//simple method to execute a block on the main thread
extension NSOperationQueue {
    static func onMain(block: () -> Void) {
        NSOperationQueue.mainQueue().addOperation(NSBlockOperation(block: block))
    }
}