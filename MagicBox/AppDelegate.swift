//
//  AppDelegate.swift
//  MagicBox
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import AVOSCloud
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        //startKeepShowStory()
        registerLeanCloudForKeep()
        
        //startShowStory()
        return true
    }

    // MARK: - LaunchPoint
    
    func startShowStory() {
        
        let storyBoard = UIStoryboard(name: "Show", bundle: nil)
        let rootVC = storyBoard.instantiateViewControllerWithIdentifier("ShowNavigationController") as! UINavigationController
        
        window?.rootViewController = rootVC
    }
    
    func startKeepShowStory() {
        
        let storyBoard = UIStoryboard(name: "KeepShow", bundle: nil)
        let rootVC = storyBoard.instantiateViewControllerWithIdentifier("KeepShowNavigationController") as! UINavigationController
        
        window?.rootViewController = rootVC
    }
    
    func registerLeanCloudForKeep() {
        AVOSCloud.setApplicationId("P2TV0oFGF5V9R86yjKMfkKLP-gzGzoHsz", clientKey: "EVJwwftsr1oBQ4bugEmp65G3")
    }
    
    func startMainStory() {
        
    }
}
   