//
//  MoviesViewModel.swift
//  CiceTmdbApp
//
//  Created by Luis Burgos on 15/3/22.
//

import Foundation

//Output del interactor
protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    
}

final class MoviesViewModel: BaseViewModel, ObservableObject {
        
    //MARK: - DI
    var interactor: MoviesInteractorInputProtocol? {
        super.baseInteractor as? MoviesInteractorInputProtocol
    }
    
    func fetchData() {
        self.interactor?.fetchDataNowPlayingInteractor()
    }
}

extension MoviesViewModel: MoviesInteractorOutputProtocol {
    
}
