//
//  HeaderComponents.swift
//  FashionApp
//
//  Created by Luis Burgos on 8/3/22.
//

import SwiftUI

struct HeaderComponents: View {
    var body: some View {
        VStack {
            titleView(title: "Header Component")
            subtitleView(subtitle: "Estamos aprendiendo SwiftUI, con XCode 12 para mejorar nuestra compresion del mundo Apple")
        }
    }
}

struct titleView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .padding(20)
            .font(.title)
            .background(Color.orange)
            .foregroundColor(.black)
            .cornerRadius(20)
    }
}

struct subtitleView: View {
    
    var subtitle: String
    
    var body: some View {
        Text(subtitle)
            .padding(.horizontal, 20)
            .font(.title3)
            .foregroundColor(.black)
    }
}

struct HeaderComponents_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponents()
    }
}
