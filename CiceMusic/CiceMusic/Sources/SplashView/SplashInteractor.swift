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
    
    func transformDataFromMusicServerModelToArrayGenericResult(data: MusicServerModel) -> [GenericResult] {
        var arrayGenericResult: [GenericResult] = []
        if let dataUnw = data.feed?.results {
            for item in dataUnw {
                let objc = GenericResult(artistName: item.artistName, id: item.id, name: item.name, kind: item.kind, artworkUrl100: item.artworkUrl100, url: item.url, releaseDate: item.releaseDate)
                arrayGenericResult.append(objc)
            }
        }
        return arrayGenericResult
    }
    
}

//Input del interactor
extension SplashInteractor: SplashInteractorInputProtocol {
    func fettchDataFromWebServiceInteractor() {
        self.splashProvider.fetchData { (result) in
            switch result {
            case .success(let modelData):
                self.presenter?.setDataFromWebInteractor(data: self.transformDataFromMusicServerModelToArrayGenericResult(data: modelData))
            case .failure(let error):
                self.presenter?.setAlertMessage(error: error)
            }
        }
    }
}
