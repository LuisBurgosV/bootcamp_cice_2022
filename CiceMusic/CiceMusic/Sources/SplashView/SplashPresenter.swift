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
}

//Output del interactor
protocol SplashInteractorOutputProtocol {
    
}

final class SplashPresenter: BasePresenter<SplashPresenterOutputProtocol, SplashInteractorInputProtocol, SplashRouterInputProtocol> {
    
}

//Input del presenter
extension SplashPresenter: SplashPresenterInputProtocol {
    func fettchDataFromWebService() {
        self.interactor?.fettchDataFromWebServiceInteractor()
    }
}

//Output del interactor
extension SplashPresenter: SplashInteractorOutputProtocol {
    
}
