//
//  CityFinderView.swift
//  MusiWeather
//
//  Created by Michael Haviv on 6/14/21.
//

import SwiftUI

struct CityFinderView: View {
    
    @State private var searchTerm = ""
    
    var body: some View {
        ZStack {
            Image("musiweatherBGImage")
                .resizable()
            VStack {
                Spacer()
                Image("musiweatherLogo")
                    .padding(.top, 20)
//                Spacer()
                Spacer(minLength: 748)
            }
            VStack {
                Spacer()
                HStack{
                    Spacer(minLength: 35)
                    TextField("Search City", text: $searchTerm)
                        .padding()
                        .background(Color("textfieldBackground").cornerRadius(10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1))
//                        .border(Color.white)
//                        .cornerRadius(10)
                        .font(.custom("Avenir", size: 16).weight(.light))
                        .foregroundColor(Color.white)
                    Spacer(minLength: 35)
                }
                Spacer(minLength: 480)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct CityFinderView_Previews: PreviewProvider {
    static var previews: some View {
        CityFinderView()
    }
}
