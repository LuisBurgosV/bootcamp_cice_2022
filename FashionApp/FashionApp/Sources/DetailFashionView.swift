//
//  DetailFashionView.swift
//  FashionApp
//
//  Created by Luis Burgos on 13/3/22.
//

import SwiftUI

struct DetailFashionView: View {
    
    var model: Row
    @State private var mySize = ""
    @SwiftUI.Environment(\.presentationMode) var presenterMode
    
    @State private var showCustomAlertView = false
    @State private var showActionSheet = false
    @State private var showAlert = false
    
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    headerInformation
                    bodyInformation
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            if showCustomAlertView {
                CustomAlertView(title: "Enhorabuena!",
                                message: "Tu seleccion se ha añadido al carrito de compras.",
                                hideCustomAlertView: self.$showCustomAlertView)
            }
        }
    }
    var headerInformation: some View {
        ZStack(alignment: .topLeading) {
            Image(model.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                GeometryReader { proxy in
                    Button(action: {
                        self.presenterMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                    })
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .clipShape(Circle())
                    .padding([.leading, .top], 10)
                    
                    Button(action: {
                        //accion
                        self.showAlert.toggle()
                    }, label: {
                        Image(systemName: "magnifyingglass")
                    })
                    .offset(x: proxy.size.width - 80, y: 25)
                    .alert(isPresented: self.$showAlert, content: {
                        Alert(title: Text("Hola soy un Alert de SwiftUI"), message: Text("Aqui estamos aprendiendo como se hace un Alert en SwiftUI"), primaryButton: .default(Text("OK"), action: {
                            //Aqui acciones
                        }), secondaryButton: .cancel(Text("Cancel"), action: {
                            //Aqui acciones
                        }))
                    })
                    
                    Button(action: {
                        //accion
                        self.showActionSheet.toggle()
                    }, label: {
                        Image(systemName: "cart")
                    })
                    .offset(x: proxy.size.width - 40, y: 25)
                    .actionSheet(isPresented: self.$showActionSheet, content: {
                        ActionSheet(title: Text("A question"), message: Text("Are you sure?"), buttons: [
                            .default(Text("Yes")) {/*accion*/},
                            .default(Text("No")) {/*accion*/},
                            .default(Text("Maybe")) {/*accion*/},
                            .destructive(Text("Delete")) {/*accion*/},
                            .cancel() {/*accion*/}
                        ])
                    })
                }
            }
            .foregroundColor(.black)
        }
    }
    
    var bodyInformation: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                VStack {
                    Text(model.name)
                        .font(.largeTitle)
                    Text(model.price)
                        .fontWeight(.heavy)
                }
                Spacer()
                HStack(spacing: 20) {
                    Circle().fill(Color.red).frame(width: 20, height: 20)
                    Circle().fill(Color.green).frame(width: 20, height: 20)
                    Circle().fill(Color.blue).frame(width: 20, height: 20)
                }
            }
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ")
                .font(.headline)
            
            Text("Select size")
                .font(.largeTitle)
            HStack {
                ForEach(customSize, id: \.self) { item in
                    Button(action: {
                        //accion
                        self.mySize = item
                    }, label: {
                        Text(item)
                            .padding()
                            .border(Color.black, width: self.mySize == item ? 1.5 : 0)
                    })
                    .foregroundColor(.black)
                }
            }
            
            HStack {
                Button(action: {
                    //accion
                }, label: {
                    Text("Add to Cart")
                        .padding()
                        .border(Color.black, width: 1.5)
                })
                .foregroundColor(.black)
                
                Spacer()
                
                Button(action: {
                    //accion
                    self.showCustomAlertView.toggle()
                }, label: {
                    Text("Buy Now")
                        .padding()
                })
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(10)
            }
        }
        .padding()
        .background(
            roudedShape()
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -30)
        )
        .padding(.top, -40)
    }
}

struct roudedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topRight, .topLeft],
                                cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}

struct DetailFashionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailFashionView(model: Row(id: 0, name: "Summer and Flares", image: "p1", price: "199 €"))
    }
}
