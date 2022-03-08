//
//  ContentView.swift
//  FashionApp
//
//  Created by Luis Burgos on 8/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            HeaderComponents()
            Text("Hola Mundo!")
                .font(.title)
            Text("Hola Mundo!")
                .font(.title)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
