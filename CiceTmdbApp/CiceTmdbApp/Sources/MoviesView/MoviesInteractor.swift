//
//  MoviesInteractor.swift
//  CiceTmdbApp
//
//  Created by Luis Burgos on 15/3/22.
//

import Foundation

//Input del interactor
protocol MoviesInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataNowPlayingInteractor()
}

//Output del provider
protocol MoviesProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInformationNowPlaying(completion: Result<[ResultNowPlaying]?, NetworkError>)
}


final class MoviesInteractor: BaseInteractor {
    
    weak var viewModel: MoviesInteractorOutputProtocol? {
        super.baseViewModel as? MoviesInteractorOutputProtocol
    }
    
    var provider: MoviesProviderInputProtocol? {
        super.baseProvider as? MoviesProviderInputProtocol
    }
    
}

//Input del Interactor
extension MoviesInteractor: MoviesInteractorInputProtocol {
    func fetchDataNowPlayingInteractor() {
        self.provider?.fetchDataNowPlayingProvider()
    }
}

//Output del provider
extension MoviesInteractor: MoviesProviderOutputProtocol {
    func setInformationNowPlaying(completion: Result<[ResultNowPlaying]?, NetworkError>) {
        switch completion {
        case .success(let data):
            
        case .failur(let error):
            debugPrint(error)
        }
    }
}
