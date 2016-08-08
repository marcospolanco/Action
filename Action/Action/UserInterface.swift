//
//  UserInterface.swift
//  Action
//
//  Created by Marcos Polanco on 8/8/16.
//  Copyright © 2016 Fanatize. All rights reserved.
//

import UIKit


//block signature for basic 'OK'-style alerts
typealias AlertOK = () -> Void


extension UIViewController {
    
    //simple method to presetn
    func presentAlert(title:String, message: String, completion: AlertOK? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: {(action: UIAlertAction!) in
            completion?()
            }))
    }
}

extension UIWindow {
    
    //simple method to determine which view controller is frontmost
    public var visibleViewController: UIViewController? {
        return UIWindow.getVisibleViewControllerFrom(self.rootViewController)
    }
    
    private static func getVisibleViewControllerFrom(vc: UIViewController?) -> UIViewController? {
        if let nc = vc as? UINavigationController {
            return UIWindow.getVisibleViewControllerFrom(nc.visibleViewController)
        } else if let tc = vc as? UITabBarController {
            return UIWindow.getVisibleViewControllerFrom(tc.selectedViewController)
        } else {
            if let pvc = vc?.presentedViewController {
                return UIWindow.getVisibleViewControllerFrom(pvc)
            } else {
                return vc
            }
        }
    }
}
