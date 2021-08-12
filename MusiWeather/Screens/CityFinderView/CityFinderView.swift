//
//  CityFinderView.swift
//  MusiWeather
//
//  Created by Michael Haviv on 6/14/21.
//

import SwiftUI

struct CityFinderView: View {
    
    @EnvironmentObject var weatherViewModel: WeatherViewModel

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
                        CitySearchTextField()
                        Spacer(minLength: 35)
                    }
                    Spacer(minLength: 480)
                }
                BackButton()
            }
            .edgesIgnoringSafeArea(.all)
            .alert(item: $weatherViewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
        }
    }
}

struct CityFinderView_Previews: PreviewProvider {
    static var previews: some View {
        CityFinderView().environmentObject(WeatherViewModel())
    }
}

struct CitySearchTextField: View {
    
    @EnvironmentObject var weatherViewModel: WeatherViewModel
    
    var placeholderText = "Search City"
    @State private var textfieldIsSelected = false

    var body: some View {
        ZStack(alignment: .leading) {
            if weatherViewModel.city.isEmpty || !textfieldIsSelected {
                MWPlaceholderText(placeholderText: placeholderText)
            }
            HStack {
                TextField("", text: $weatherViewModel.city)
                    .font(.custom("Avenir", size: 16).weight(.light))
                    .foregroundColor(Color.white)
                    .onTapGesture {
                        textfieldIsSelected = true
                    }
                NavigationLink(
                    destination: MusiWeatherView(),
                    isActive: $weatherViewModel.isTextFieldLinkActive) {
                    Button(action: {
                        weatherViewModel.locationValidation(searchTerm: weatherViewModel.city)
                    }, label: {
                        Image(systemName: "location")
                            .foregroundColor(Color("musiweatherOrange"))
                    })
                }
            }
            .padding(12)
            .background(Color("textfieldBackground").cornerRadius(10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1))
        }
        .alert(item: $weatherViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
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

struct MWPlaceholderText: View {
    
    var placeholderText: String
    
    var body: some View {
        Text(placeholderText)
            .foregroundColor(.white)
            .font(.custom("Avenir", size: 16))
            .fontWeight(.light)
            .padding(.leading, 15)
    }
}
