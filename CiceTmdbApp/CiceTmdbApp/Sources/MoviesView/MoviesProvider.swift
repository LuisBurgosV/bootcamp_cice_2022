//
//  MoviesProvider.swift
//  CiceTmdbApp
//
//  Created by Luis Burgos on 15/3/22.
//

import Foundation

protocol MoviesProviderInputProtocol: BaseProviderInputProtocol {
      func fetchDataNowPlayingProvider()
}

final class MoviesProvider: BaseProvider {
    
}

extension MoviesProvider: MoviesProviderInputProtocol {
    func fetchDataNowPlayingProvider() {
        
    }
}
