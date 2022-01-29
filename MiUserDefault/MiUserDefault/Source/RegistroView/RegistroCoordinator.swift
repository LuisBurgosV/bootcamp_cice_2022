//
//  RegistroCoordinator.swift
//  MiUserDefault
//
//  Created by Luis Burgos on 29/1/22.
//

import UIKit

final class RegistroCoordinator {
    
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController (rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = RegistroViewController()
        return vc
    }
}
