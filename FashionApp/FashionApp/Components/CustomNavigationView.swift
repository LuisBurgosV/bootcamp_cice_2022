//
//  CustomNavigationView.swift
//  FashionApp
//
//  Created by Luis Burgos on 12/3/22.
//

import SwiftUI

struct CustomNavigationView: View {
    
    @State private var showAlert = false
    @State private var showAlertDos = false
    
    var body: some View {
        ZStack {
            Text("Seasons").font(.system(size: 20))
            
            HStack(spacing: 8) {
                //Alerta con xCODE12
                Button(action: {
                    self.showAlert.toggle()
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                })
                .alert(isPresented: self.$showAlert, content: {
                    Alert(title: Text("Hola soy un Alert de SwiftUI"), message: Text("Aqui estamos aprendiendo como se hace un Alert en SwiftUI"), primaryButton: .default(Text("OK"), action: {
                        //Aqui acciones
                    }), secondaryButton: .cancel(Text("Cancel"), action: {
                        //Aqui acciones
                    }))
                })
                Spacer()
                
                //Alerta con xCODE13
                Button(action: {
                    //Aqui la accion
                }, label: {
                    Image(systemName: "magnifyingglass")
                })
                
                Button(action: {
                    //Aqui la accion
                }, label: {
                    Image(systemName: "alarm")
                })
            }
            .padding(.horizontal, 8)
            .font(.callout)
            .foregroundColor(.black)
        }
        .background(Color.white)
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView()
    }
}
