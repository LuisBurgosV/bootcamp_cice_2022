//
//  AppDelegate.swift
//  MiAppIntroduccionTableView
//
//  Created by Luis Burgos on 24/1/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appCoordinator: AppCoordinatorProtocol = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if let windowUnw = self.window {
            appCoordinator.setPrincipalViewController(window: windowUnw)
        }
        
        return true
    }


}

