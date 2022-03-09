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
            Button {
                //Aqui es donde se captura la accion
            } label: {
                HStack {
                    Image(systemName: "play")
                    Text("Play")
                }
            }
            .padding()
            .font(.title2)
            .foregroundColor(.black)
            .background(Color.yellow)
            .cornerRadius(10)
            .shadow(radius: 10)
        })
    }
}

struct RefactoringView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                HeaderComponents()
                Image(systemName: "hand.thumbsup.fill")
                    .font(.system(size: 50))
                Image("helloworld")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.horizontal, .bottom], 20)
                    .shadow(color: Color.black.opacity(0.5), radius: 20, x: 5, y: 5)
                    .overlay(
                        Text("Hola guapos")
                            .foregroundColor(.red)
                            .font(.title)
                            .fontWeight(.heavy)
                    )
            }
        }
    }
}

struct ShapesView: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderComponents()
            Text("Se pueden meter shapes para decorar las vistas")
                .foregroundColor(.orange)
                .padding(3)
                .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.black)
                )
                .padding(8)
            Text("Se puede ajustar el fondo pero no con un shape")
                .foregroundColor(.orange)
                .padding(10)
                .background(Color.black)
                .cornerRadius(20)
                .padding(8)
                .shadow(radius: 10)
        }
    }
}

struct VerticalStackView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                HeaderComponents()
                
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("La VStack dentro de otra VStack")
                    Divider().background(Color.white)
                    Text("Esta puede tener subvistas")
                    Divider().background(Color.white)
                    Text("Hasta un maximo de 10")
                    Divider().background(Color.white)
                    Image(systemName: "arrow.left")
                })
                .font(.title2)
                .padding()
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.blue)
                )
                .padding()
                
                VStack(alignment: .trailing, spacing: 10, content: {
                    Text("La VStack dentro de otra VStack")
                    Divider().background(Color.white)
                    Text("Esta puede tener subvistas")
                    Divider().background(Color.white)
                    Text("Hasta un maximo de 10")
                    Divider().background(Color.white)
                    Image(systemName: "arrow.right")
                })
                .font(.title2)
                .padding()
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.blue)
                )
                .padding()
                
                HeaderComponents()
                HeaderComponents()
                HeaderComponents()
                HeaderComponents()
                HeaderComponents()
                HeaderComponents()
                HeaderComponents()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()
        //RefactoringView()
        //ShapesView()
        VerticalStackView()
    }
}
