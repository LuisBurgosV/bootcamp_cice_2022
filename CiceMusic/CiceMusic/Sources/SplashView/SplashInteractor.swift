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
        self.splashProvider.fetchData { [weak self] (result) in
            guard self != nil else { return }
            switch result {
            case let .success(model):
                self?.presenter?.setDataFromWebInteractor(data: model.menuResponse)
            case .failure(let error):
                self?.presenter?.setAlertMessage(error: error)
            }
        }
    }
}
