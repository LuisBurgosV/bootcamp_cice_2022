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
