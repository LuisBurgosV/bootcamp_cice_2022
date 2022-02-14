//
//  CategoriaCoordinator.swift
//  MiTaskVersion3.0
//
//  Created by Luis Burgos on 30/1/22.
//

import UIKit

final class CategoriaCoordinator {
    
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view(delegate: CategoriaViewControllerDelegate? = nil) -> UIViewController {
        let vc = CategoriaViewController()
        vc.delegate = delegate
        return vc
    }
}
