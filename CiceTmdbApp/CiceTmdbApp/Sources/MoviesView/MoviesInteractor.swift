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
    func fetchDataPopularInteractor()
    func fetchDataTopRatedInteractor()
    func fetchDataUpcomingInteractor()
}

//Output del provider
protocol MoviesProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInformationNowPlaying(completion: Result<[ResultNowPlaying]?, NetworkError>)
    func setInformationPopular(completion: Result<[ResultNowPlaying]?, NetworkError>)
    func setInformationTopRated(completion: Result<[ResultNowPlaying]?, NetworkError>)
    func setInformationUpcoming(completion: Result<[ResultNowPlaying]?, NetworkError>)
}

final class MoviesInteractor: BaseInteractor {
    //MARK: - DI
    weak var viewModel: MoviesInteractorOutputProtocol? {
        super.baseViewModel as? MoviesInteractorOutputProtocol
    }
    
    //MARK: - DI
    var provider: MoviesProviderInputProtocol? {
        super.baseProvider as? MoviesProviderInputProtocol
    }
    
    //Metodos transformacion
    func transformDataResultToMoviesTVModelView(data: [ResultNowPlaying]?) -> [MoviesTVModelView]? {
        var datasourceMoviesTV: [MoviesTVModelView] = []
        if let dataUnw = data {
            for index in 0..<dataUnw.count {
                let object = MoviesTVModelView(id: dataUnw[index].id,
                                               backdropPath: dataUnw[index].backdropPath,
                                               posterPath: dataUnw[index].posterPath,
                                               name: dataUnw[index].originalTitle)
                datasourceMoviesTV.append(object)
            }
        }
        return datasourceMoviesTV
    }
}

//Input del Interactor
extension MoviesInteractor: MoviesInteractorInputProtocol {
    func fetchDataUpcomingInteractor() {
        self.provider?.fetchDataUpcomingProvider()
    }
    
    func fetchDataPopularInteractor() {
        self.provider?.fetchDataPopularProvider()
    }
    
    func fetchDataTopRatedInteractor() {
        self.provider?.fetchDataTopRatedProvider()
    }
    
    func fetchDataNowPlayingInteractor() {
        self.provider?.fetchDataNowPlayingProvider()
    }
}

//Output del provider
extension MoviesInteractor: MoviesProviderOutputProtocol {
    func setInformationPopular(completion: Result<[ResultNowPlaying]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoPopularViewModel(data: self.transformDataResultToMoviesTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationTopRated(completion: Result<[ResultNowPlaying]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoTopRatedViewModel(data: self.transformDataResultToMoviesTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationUpcoming(completion: Result<[ResultNowPlaying]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoUpcomingViewModel(data: self.transformDataResultToMoviesTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationNowPlaying(completion: Result<[ResultNowPlaying]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoNowPlayingViewModel(data: self.transformDataResultToMoviesTVModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
}
