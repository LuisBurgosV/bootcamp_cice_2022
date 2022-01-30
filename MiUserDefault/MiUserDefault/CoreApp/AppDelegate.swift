//
//  AppDelegate.swift
//  MiUserDefault
//
//  Created by Luis Burgos on 29/1/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoreCoodinator: AppCoreCoordinatorProtocol = AppCoreCoordinator()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        if let windowUnw = self.window {
            self.appCoreCoodinator.initialViewController(window: windowUnw)
        }
        
        return true
    }
}
