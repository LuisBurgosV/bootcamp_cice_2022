//
//  HomeTabBarCoordinator.swift
//  CiceMusic
//
//  Created by Luis Burgos on 19/2/22.
//

import UIKit

final class HomeTabBarCoordinator {
    static func tabBarController(dto: HomeTabBarCoordinatorDTO? = nil) -> UITabBarController {
        
        let tbc = HomeTabBarViewController()
        
        //Controllers
        let musicVC = MusicCoordinator.navigation(dto: MusicCoordinatorDTO(model: dto?.data))
        let podcastVC = PodcastCoordinator.navigation()
        let booksVC = BookCoordinator.navigation()
        
        //Icons
        let iconMusic = UITabBarItem(title: "Music", image: UIImage(systemName: "music.note.list"), selectedImage: UIImage(systemName: "music.note.list"))
        
        let iconPodcast = UITabBarItem(title: "Music", image: UIImage(systemName: "music.note.house.fill"), selectedImage: UIImage(systemName: "music.note.house.fill"))
        
        let iconBooks = UITabBarItem(title: "Music", image: UIImage(systemName: "book"), selectedImage: UIImage(systemName: "book.fill"))
        
        //Asignamos el icono al controlador
        musicVC.tabBarItem = iconMusic
        podcastVC.tabBarItem = iconPodcast
        booksVC.tabBarItem = iconBooks
        
        tbc.viewControllers = [musicVC, podcastVC, booksVC]
                
        return tbc
    }
}

struct HomeTabBarCoordinatorDTO {
    var data: [GenericResult]
}
