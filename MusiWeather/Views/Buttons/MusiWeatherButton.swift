//
//  MusiWeatherButton.swift
//  MusiWeather
//
//  Created by Michael Haviv on 6/14/21.
//

import SwiftUI

struct MusiWeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: String
    
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .background(Color(backgroundColor))
            .foregroundColor(textColor)
            .font(.custom("Avenir", size: 16).weight(.bold))
            .cornerRadius(25)
    }
}

//struct MusiWeatherButton_Previews: PreviewProvider {
//    static var previews: some View {
//        MusiWeatherView()
//    }
//}
