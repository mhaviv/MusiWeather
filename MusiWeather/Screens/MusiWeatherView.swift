//
//  MusiWeatherView.swift
//  MusiWeather
//
//  Created by Michael Haviv on 6/13/21.
//

import SwiftUI

struct MusiWeatherView: View {
    var body: some View {
        ZStack {
            Image("musiweatherBGImage")
                .resizable()
            VStack {
                VStack{
                    Text("Showing Weather in")
                        .padding(.bottom, 10)
                        .font(.custom("Avenir", size: 12).weight(.medium))
                        .foregroundColor(.white)
                    Text("Los Angeles, CA")
                        .foregroundColor(.white)
                        .font(.custom("Avenir", size: 18).weight(.heavy))
                    Text("United States")
                        .font(.custom("Avenir", size: 12).weight(.regular))
                        .foregroundColor(.white)
                    Button {
                        
                    } label: {
                        Text("Change City")
                            .padding(.top, 3)
                            .foregroundColor(Color("musiweatherOrange"))
                            .font(.custom("Avenir", size: 12).weight(.heavy))
                    }
                }
                .padding(.bottom, 3)
                HStack {
                    Spacer(minLength: 20)
                    VStack {
                        HStack {
                            Spacer()
                            VStack {
                                HStack {
                                    Image("partlyCloudy")
                                        .foregroundColor(.white)
                                    HStack {
                                        Text("Partly Cloudy")
                                            .font(.custom("Avenir", size: 21).weight(.medium))
                                            .foregroundColor(.white)
                                    }
                                }
                                HStack (spacing: 45) {
                                    HStack {
                                        Image("temp")
                                            .foregroundColor(.white)
                                        Text("87°F")
                                            .font(.custom("Avenir", size: 12).weight(.medium))
                                            .foregroundColor(.white)
                                    }
                                    HStack {
                                        Image("windSpeed")
                                            .foregroundColor(.white)
                                        Text("4 mph")
                                            .font(.custom("Avenir", size: 12).weight(.medium))
                                            .foregroundColor(.white)
                                    }
                                    
                                    HStack {
                                        Image("percentRain")
                                            .foregroundColor(.white)
                                        Text("10%")
                                            .font(.custom("Avenir", size: 12).weight(.medium))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            Spacer()
                        }
                        
                        
                    }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black]), startPoint: .top, endPoint: .bottom)).opacity(0.4))
                        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
                        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
                    Spacer(minLength: 20)
                }
            }
            
            VStack {
                HStack {
                    
                }
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct MusiWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MusiWeatherView()
    }
}
