//
//  SplashRouter.swift
//  CiceMusic
//
//  Created by Luis Burgos on 16/2/22.
//

import Foundation

//Input del router
protocol SplashRouterInputProtocol {
    func showHomeTabBarRouter(dataSource: [ResultMusic])
}

final class SplashRouter: BaseRouter<SplashViewController> {
    
}

//Input del router
extension SplashRouter: SplashRouterInputProtocol {
    func showHomeTabBarRouter(dataSource: [ResultMusic]) {
        debugPrint(dataSource)
    }
}
