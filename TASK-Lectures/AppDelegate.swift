//
//  AppDelegate.swift
//  TASK-Lectures
//
//  Created by Tomislav Gelesic on 15/10/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let firstScreen = UINavigationController(rootViewController: InputViewController())
        
        window = UIWindow()
        window?.rootViewController = firstScreen
        window?.makeKeyAndVisible()
        
        return true
    }


}

