//
//  AppDelegate.swift
//  PlaygroundPrototype
//
//  Created by 韮澤賢三 on 2016/03/29.
//  Copyright © 2016年 KenzoNirasawa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let viewController = ViewController()
        let navController = UINavigationController(rootViewController: viewController)
        self.window?.rootViewController = navController
        viewController.title = "Prefecture Names"
        self.window!.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }


}

