//
//  ApplicationFlow.swift
//  Action
//
//  Created by Marcos Polanco on 8/8/16.
//  Copyright © 2016 Fanatize. All rights reserved.
//

import Foundation

class ApplicationFlow {
    
    init() {
        Database.delegate = self
    }
    
    //start the flow of the application.
    func start() {
        //no actions at this time
    }
}

//MARK: DatabaseDelegate protocol implementation

extension ApplicationFlow: DatabaseDelegate {

    func didSave(status: Bool) {
        print("\(#function): status: \(status)")//FIX - incomplete implementation
    }
}