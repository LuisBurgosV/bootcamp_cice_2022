//
//  ListaPostsCoordinator.swift
//  MiUserDefault
//
//  Created by Luis Burgos on 30/1/22.
//

import UIKit

final class ListaPostsCoordinator {
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = ListaPostsViewController()
        return vc
    }
}
