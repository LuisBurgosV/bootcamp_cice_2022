//
//  HomeTabBarCoordinator.swift
//  MiAppIntroduccionTableView
//
//  Created by Luis Burgos on 25/1/22.
//

import UIKit

final class HomeTabBarCoordinator {
    
    static func tabBarController() -> UITabBarController {
        let tabVC = HomeTabBarViewController()
        
        // Controladores
        let listaMeses = ListaCochesCoordinator.navigation()
        let listaCoches = ListSuperCochesCoordinator.navigation()
        
        // Iconos
        let listaMesesIcon = UITabBarItem(title: "Meses", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let listaCochesIcon = UITabBarItem(title: "Coches", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        // Asignar Icono al Controlador
        listaMeses.tabBarItem = listaMesesIcon
        listaCoches.tabBarItem = listaCochesIcon

        
        // Asignamos el array de controladores y su orden
        tabVC.viewControllers = [listaMeses, listaCoches]
        return tabVC
    }
    
}
