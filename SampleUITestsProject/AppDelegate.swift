//
//  AppDelegate.swift
//  SampleUITestsProject
//
//  Created by Clement Roulland on 16-11-02.
//  Copyright © 2016 clement. All rights reserved.
//

import UIKit
import SBTUITestTunnel

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    override class func initialize() {
        #if DEBUG
            SBTUITestTunnelServer.takeOff()
        #endif
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

}

