//
//  SplashPresenter.swift
//  CiceMusic
//
//  Created by Luis Burgos on 16/2/22.
//

import Foundation

//Input del presenter
protocol SplashPresenterInputProtocol {
    func fettchDataFromWebService()
    func showHomeTabBar()
}

//Output del interactor
protocol SplashInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [ResultMusic]?)
}

final class SplashPresenter: BasePresenter<SplashPresenterOutputProtocol, SplashInteractorInputProtocol, SplashRouterInputProtocol> {
    
    var dataSourceMusic: [ResultMusic] = []
    
}

//Input del presenter
extension SplashPresenter: SplashPresenterInputProtocol {
    func fettchDataFromWebService() {
        self.interactor?.fettchDataFromWebServiceInteractor()
    }
    
    func showHomeTabBar() {
        self.router?.showHomeTabBarRouter(dataSource: self.dataSourceMusic)
    }
}

//Output del interactor
extension SplashPresenter: SplashInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [ResultMusic]?) {
        guard let dataUnw = data else { return }
        
        self.dataSourceMusic.removeAll()
        self.dataSourceMusic = dataUnw
        self.viewController?.launchAnimation()
        
    }
}
