//
//  FashionView.swift
//  FashionApp
//
//  Created by Luis Burgos on 12/3/22.
//

import SwiftUI

struct FashionView: View {
    
    @State private var showCustomAlertView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    CustomNavigationView(showAlertTres: self.$showCustomAlertView)
                    CustomBodyMainView()
                }
                .blur(radius: self.showCustomAlertView ? 3 : 0)
                
                if showCustomAlertView {
                    CustomAlertView(title: "Esta es una Custo AlertView", message: "Esta es una alerta personalizada y se colocara encima de la vista principal y se añadira un efecto de blur y el fondo medio opaco", hideCustomAlertView: self.$showCustomAlertView)
                        .animation(.easeInOut, value: self.showCustomAlertView)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct FashionView_Previews: PreviewProvider {
    static var previews: some View {
        FashionView()
    }
}
