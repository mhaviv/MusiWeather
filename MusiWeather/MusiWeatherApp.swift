//
//  MusiWeatherApp.swift
//  MusiWeather
//
//  Created by Michael Haviv on 6/13/21.
//

import SwiftUI

@main
struct MusiWeatherApp: App {
    @ObservedObject var cityVM: CityViewVM = CityViewVM()
    
    init() {
        
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView(cityVM: cityVM)
        }
    }
}
