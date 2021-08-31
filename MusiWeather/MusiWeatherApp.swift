//
//  MusiWeatherApp.swift
//  MusiWeather
//
//  Created by Michael Haviv on 6/13/21.
//

import GooglePlaces
import SwiftUI

let googlePlacesKey = API.googlePlacesKey

@main
struct MusiWeatherApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var weatherViewModel = WeatherViewModel()
    
    var body: some Scene {
        WindowGroup {
            LoginView().environmentObject(weatherViewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate    {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GMSPlacesClient.provideAPIKey(googlePlacesKey)
        return true
    }
 }
