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


final class MoviesInteractor: BaseInteractor {
    
    weak var viewModel: MoviesInteractorOutputProtocol? {
        super.baseViewModel as? MoviesInteractorOutputProtocol
    }
    
}

extension MoviesInteractor: MoviesInteractorInputProtocol {
    func fetchDataNowPlayingInteractor() {
        
    }
}
