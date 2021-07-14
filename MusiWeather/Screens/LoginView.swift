//
//  LoginView.swift
//  MusiWeather
//
//  Created by Michael Haviv on 6/14/21.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var cityVM: CityViewVM
        
    var body: some View {
        NavigationView {
            ZStack {
                Image("musiweatherBGImage")
                    .resizable()
                VStack {
                    Spacer()
                    Image("musiweatherLogo")
                        .padding(.top, 20)
                    //                Spacer()
                    Spacer(minLength: 530)
                }
                VStack {
                    Spacer(minLength: 675)
                    NavigationLink(
                        destination: CityFinderView(cityVM: cityVM),
                        label: {
                            MusiWeatherButton(title: "CONNECT WITH SPOTIFY", textColor: .white, backgroundColor: "musiweatherOrange")
                        })
                    Spacer()
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        MusiWeatherView()
//    }
//}
