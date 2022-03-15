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
        VStack {
            Text("2")
        }
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
