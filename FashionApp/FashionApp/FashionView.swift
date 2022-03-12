//
//  FashionView.swift
//  FashionApp
//
//  Created by Luis Burgos on 12/3/22.
//

import SwiftUI

struct FashionView: View {
    var body: some View {
        VStack {
            CustomNavigationView()
            CustomBodyMainView()
        }
    }
}

struct FashionView_Previews: PreviewProvider {
    static var previews: some View {
        FashionView()
    }
}
