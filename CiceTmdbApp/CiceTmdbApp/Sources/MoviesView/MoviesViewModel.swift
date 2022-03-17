//
//  MoviesViewModel.swift
//  CiceTmdbApp
//
//  Created by Luis Burgos on 15/3/22.
//

import Foundation

//Output del interactor
protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [MoviesTVModelView]?)
}

final class MoviesViewModel: BaseViewModel, ObservableObject {
        
    //MARK: - DI
    var interactor: MoviesInteractorInputProtocol? {
        super.baseInteractor as? MoviesInteractorInputProtocol
    }
    
    //MARK: - Variables
    @Published var dataSourceNowPlaying: [MoviesTVModelView] = []
    
    //MARK: - Metodos
    func fetchData() {
        self.interactor?.fetchDataNowPlayingInteractor()
    }
}

extension MoviesViewModel: MoviesInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [MoviesTVModelView]?) {
        self.dataSourceNowPlaying.removeAll()
        self.dataSourceNowPlaying = data ?? []
    }
}
