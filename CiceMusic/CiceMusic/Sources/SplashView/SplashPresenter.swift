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
    func setDataFromWebInteractor(data: [GenericResult]?)
    func setAlertMessage(error: NetworkError)
}

final class SplashPresenter: BasePresenter<SplashPresenterOutputProtocol, SplashInteractorInputProtocol, SplashRouterInputProtocol> {
    
    var dataSourceViewModel: [GenericResult] = []
    
}

//Input del presenter
extension SplashPresenter: SplashPresenterInputProtocol {
    func fettchDataFromWebService() {
        self.interactor?.fettchDataFromWebServiceInteractor()
    }
    
    func showHomeTabBar() {
        self.router?.showHomeTabBarRouter(dataSource: self.dataSourceViewModel)
    }
}

//Output del interactor
extension SplashPresenter: SplashInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [GenericResult]?) {
        guard let dataUnw = data else { return }
        
        self.dataSourceViewModel.removeAll()
        self.dataSourceViewModel = dataUnw
        self.viewController?.launchAnimation()
    }
    
    func setAlertMessage(error: NetworkError) {
        DispatchQueue.main.async {
            self.router?.showAlert(title: "\(error.status)", message: error.status.rawValue == -1011 ? error.localizedDescription : "AQUI LUIS")
        }
    }
}
