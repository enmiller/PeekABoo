//
//  AppDelegate.swift
//  PeekABoo
//
//  Created by Eric Miller on 10/25/15.
//  Copyright © 2015 Eric Miller. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var shortcutItem: UIApplicationShortcutItem?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        var performShortcutDelegate = true
        
        if let shortcut = launchOptions?[UIApplicationLaunchOptionsShortcutItemKey] as? UIApplicationShortcutItem {
            shortcutItem = shortcut
            
            performShortcutDelegate = false
        }
        
        return performShortcutDelegate
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        guard let shortcut = shortcutItem else { return }
        
        handleShortcut(shortcut)
        
        self.shortcutItem = nil
        
    }
    
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        completionHandler(handleShortcut(shortcutItem))
    }
    
    func handleShortcut(shortcut: UIApplicationShortcutItem) -> Bool {
        var succeeded = false
        
        switch (shortcut.type) {
        case "com.tinyzepplin.PeekABoo.blueScreen":
            succeeded = true
            
            if let vc = window?.rootViewController as? ViewController {
                vc.view.backgroundColor = .blueColor()
            }
        case "com.tinyzepplin.PeekABoo.redScreen":
            succeeded = true
            
            if let vc = window?.rootViewController as? ViewController {
                vc.view.backgroundColor = .redColor()
            }
        case "com.tinyzepplin.PeekABoo.greenScreen":
            succeeded = true
            
            if let vc = window?.rootViewController as? ViewController {
                vc.view.backgroundColor = .greenColor()
            }
        default: break
        }
        
        return succeeded
    }
}

