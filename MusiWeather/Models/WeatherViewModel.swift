//
//  File.swift
//  MusiWeather
//
//  Created by Michael Haviv on 8/2/21.
//

import SwiftUI
import CoreLocation

final class WeatherViewModel: ObservableObject {
    
    @Published var city = ""
    @Published var weather = WeatherResponse.empty()
    @Published var alertItem: AlertItem?
    @Published var isTextFieldLinkActive = false
    @Published var textfieldIsSelected = false
    
    func locationValidation(searchTerm: String) {
                
        if searchTerm.isEmpty {
            alertItem = AlertContext.emptyCity
            return
        }
        
        getLocation()
    }
    
    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks, let place = places.first {
                self.getWeather(coord: place.location?.coordinate)
            } else {
                self.alertItem = AlertContext.invalidCity
                return
            }
        }
    }
    
    private func getWeather(coord: CLLocationCoordinate2D?) {
        if let coord = coord {
            let urlString = API.getURLFor(lat: coord.latitude, lon: coord.longitude)
            getWeatherInternal(city: city, for: urlString)
        } else {
            let urlString = API.getURLFor(lat: 40.574268, lon: -74.609879)
            getWeatherInternal(city: city, for: urlString)
        }
    }
    
    private func getWeatherInternal(city: String, for urlString: String) {
        NetworkManager.shared.getWeather(for: urlString) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                    self.isTextFieldLinkActive = true
                }
                
            //TODO: Add error case
            case .failure(let err):
                print(err)
            }
        }
    }

}
