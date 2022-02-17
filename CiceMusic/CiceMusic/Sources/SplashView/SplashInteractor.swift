//
//  SplashInteractor.swift
//  CiceMusic
//
//  Created by Luis Burgos on 16/2/22.
//

import Foundation

//Input del interactor
protocol SplashInteractorInputProtocol {
    func fettchDataFromWebServiceInteractor()
}


final class SplashInteractor: BaseInteractor<SplashInteractorOutputProtocol> {
    let splashProvider: SplashProviderInputProtocol = SplashProvider()
}

//Input del interactor
extension SplashInteractor: SplashInteractorInputProtocol {
    func fettchDataFromWebServiceInteractor() {
        self.splashProvider.fetchData()
    }
}
