//
//  CityFinderView.swift
//  MusiWeather
//
//  Created by Michael Haviv on 6/14/21.
//

import SwiftUI

struct CityFinderView: View {
    
    @ObservedObject var cityVM: CityViewVM
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("musiweatherBGImage")
                    .resizable()
                MWLogo()
                VStack {
                    Spacer()
                    HStack{
                        Spacer(minLength: 35)
                        CitySearchTextField(cityVM: cityVM)
                        Spacer(minLength: 35)
                    }
                    Spacer(minLength: 480)
                }
                BackButton()
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

//struct CityFinderView_Previews: PreviewProvider {
//    static var previews: some View {
//        MusiWeatherView()
//    }
//}

struct CitySearchTextField: View {
    
    @ObservedObject var cityVM: CityViewVM
    
    @State private var searchTerm = ""
    
    var body: some View {
        ZStack(alignment: .leading) {
            if searchTerm.isEmpty { Text("Search City")
                .foregroundColor(.white)
                .font(.custom("Avenir", size: 16))
                .fontWeight(.light)
                .padding(.leading, 15)
            }
            HStack {
                TextField("", text: $searchTerm)
                    .font(.custom("Avenir", size: 16).weight(.light))
                    .foregroundColor(Color.white)
                NavigationLink(
                    destination: MusiWeatherView(cityVM: cityVM),
                    label: {
                        Image(systemName: "location")
                            .foregroundColor(Color("musiweatherOrange"))
                    })
            }
            .padding(12)
            .background(Color("textfieldBackground").cornerRadius(10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1))
        }
    }
}

struct BackButton: View {
    var body: some View {
        VStack {
            Spacer(minLength: 750)
            HStack{
                HStack {
                    Image(systemName: "chevron.backward")
                        .font(.custom("SF Compact", size: 16).weight(.regular))
                    Text("Back")
                        .font(.custom("Avenir", size: 16).weight(.heavy))
                }
                .foregroundColor(Color.white)
                .padding(.leading, 15)
                Spacer()
            }
            Spacer()
        }
    }
}

struct MWLogo: View {
    var body: some View {
        VStack {
            Spacer()
            Image("musiweatherLogo")
                .padding(.top, 100)
            //                Spacer()
            Spacer(minLength: 748)
        }
    }
}
