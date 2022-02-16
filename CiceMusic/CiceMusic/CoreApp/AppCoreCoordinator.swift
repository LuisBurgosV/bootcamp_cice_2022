//
//  AppCoreCoordinator.swift
//  CiceMusic
//
//  Created by Luis Burgos on 16/2/22.
//

import UIKit

protocol AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow)
}

final class AppCoreCoordinator {
    var actualVC = UIViewController()
}

extension AppCoreCoordinator: AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow) {
        self.actualVC = UIViewController()
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
}
