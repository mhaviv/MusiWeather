//
//  MusiWeatherApp.swift
//  MusiWeather
//
//  Created by Michael Haviv on 6/13/21.
//

import SwiftUI

@main
struct MusiWeatherApp: App {
    
    var weatherViewModel = WeatherViewModel()
    
    var body: some Scene {
        WindowGroup {
            LoginView().environmentObject(weatherViewModel)
        }
    }
}
