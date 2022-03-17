//
//  MoviesTVModelView.swift
//  CiceTmdbApp
//
//  Created by Luis Burgos on 17/3/22.
//

import Foundation

struct MoviesTVModelView: Identifiable {
    let id: Int?
    let backdropPath: String?
    let posterPath: String?
    let name: String?
    
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
    
    var backdropUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(backdropPath ?? "")")!
    }
}
