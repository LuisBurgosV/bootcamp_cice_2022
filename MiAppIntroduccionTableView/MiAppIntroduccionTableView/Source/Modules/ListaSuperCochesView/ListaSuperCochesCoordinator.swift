//
//  ListaSuperCochesCoordinator.swift
//  MiAppIntroduccionTableView
//
//  Created by Luis Burgos on 25/1/22.
//

import UIKit

final class ListSuperCochesCoordinator {
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = ListaSuperCochesViewController()
        return vc
    }
}
