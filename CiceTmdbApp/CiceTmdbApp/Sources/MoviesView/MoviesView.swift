//
//  MoviesView.swift
//  CiceTmdbApp
//
//  Created by Luis Burgos on 15/3/22.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject var viewModel = MoviesViewModel()
    
    var body: some View {
        List {
            Group {
                if !self.viewModel.dataSourceNowPlaying.isEmpty {
                    MoviesPosterCarrousel(title: "Now Playing", moviesModel: self.viewModel.dataSourceNowPlaying, isPoster: false)
                }
            }
            Group {
                if !self.viewModel.dataSourcePopular.isEmpty {
                    MoviesPosterCarrousel(title: "Popular", moviesModel: self.viewModel.dataSourcePopular, isPoster: true)
                }
            }
            Group {
                if !self.viewModel.dataSourceTopRated.isEmpty {
                    MoviesPosterCarrousel(title: "Top Rated", moviesModel: self.viewModel.dataSourceTopRated, isPoster: false)
                }
            }
            Group {
                if !self.viewModel.dataSourceUpcoming.isEmpty {
                    MoviesPosterCarrousel(title: "Upcoming", moviesModel: self.viewModel.dataSourceUpcoming, isPoster: true)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle(Text("Movies"))
        .onAppear {
            self.viewModel.fetchData()
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
