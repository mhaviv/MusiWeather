//
//  API+Ext.swift
//  MusiWeather
//
//  Created by Michael Haviv on 8/2/21.
//

import Foundation

extension API {
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"
    
    
    /// Get the lattitude and longittude from the OpenWeather API and output the API url with the proper parameters in place
    /// - Parameters:
    ///   - lat: Latitude
    ///   - lon: Longitude
    /// - Returns: URL String
    static func getURLFor(lat: Double, lon: Double) -> String {
        return "\(baseURLString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)&units=imperial"
    }
}
