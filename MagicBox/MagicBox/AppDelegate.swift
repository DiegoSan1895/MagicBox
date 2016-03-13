//
//  AppDelegate.swift
//  MagicBox
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        startShowStory()
        return true
    }

    // MARK: - LaunchPoint
    
    func startShowStory() {
        
        let storyBoard = UIStoryboard(name: "Show", bundle: nil)
        let rootVC = storyBoard.instantiateViewControllerWithIdentifier("ShowNavigationController") as! UINavigationController
        
        window?.rootViewController = rootVC
    }
    
    func startMainStory() {
        
    }
}

