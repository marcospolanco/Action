//
//  AppDelegate.swift
//  Action
//
//  Created by Marcos Polanco on 8/7/16.
//  Copyright © 2016 Fanatize. All rights reserved.
//

import UIKit
import DATAStack

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    //provide a way to reach the
    static var applicationFlow: ApplicationFlow?
    var window: UIWindow?
    
    //initialize the data stack
    let dataStack = DATAStack(modelName: Database.name)
    
    static var sharedAppDelegate: AppDelegate? {
        return UIApplication.sharedApplication().delegate as? AppDelegate
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        AppDelegate.applicationFlow = ApplicationFlow()
        
        //start the application flow on the main thread, so as to avoid blocking app launch
        Threads.onMain{AppDelegate.applicationFlow?.start()}

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }
}

