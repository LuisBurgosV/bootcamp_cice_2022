//
//  HomeViewCoordinator.swift
//  MiUserDefault
//
//  Created by Luis Burgos on 30/1/22.
//

import UIKit

final class HomeViewCoordinator {
    
    static func homeView() -> UITabBarController {
        let homeVC = HomeViewController()
        
        let listaCochesVC = ListCochesCoordinator.navigation()
        let listaPostVC = ListaPostsCoordinator.navigation()
        
        let iconCoches = UITabBarItem(title: "Coches", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        let iconPosts = UITabBarItem(title: "Post", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        listaCochesVC.tabBarItem = iconCoches
        listaPostVC.tabBarItem = iconPosts
        
        homeVC.viewControllers = [listaCochesVC, listaPostVC]
        
        var vc = RegistroCoordinator.view()
        vc = nil

        return homeVC
    }
}
