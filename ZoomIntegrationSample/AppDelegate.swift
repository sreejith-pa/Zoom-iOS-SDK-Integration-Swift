//
//  AppDelegate.swift
//  ZoomIntegrationSample
//
//  Created by Sreejith on 20/04/20.
//  Copyright © 2020 Sreejith. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate  {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
                
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = mainStoryboard.instantiateViewController(withIdentifier: "vc") as! ViewController
        
        let navigationController = UINavigationController(rootViewController: VC)
        navigationController.isNavigationBarHidden = true
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = navigationController
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        
        // Authenticate usage of Zoom MobileRTC SDK.
        ZoomMeetingService.sharedInstance.authenticateSDK()
        
        return true
    }
    
}

