//
//  ContentView.swift
//  MusiWeather
//
//  Created by Michael Haviv on 6/13/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("musiweatherBGImage")
                .resizable()
            VStack {
                Image("musiweatherLogo")
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
