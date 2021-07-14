//
//  WeatherResponse.swift
//  MusiWeather
//
//  Created by Michael Haviv on 6/28/21.
//

import Foundation

struct WeatherResponse: Codable {
    var current: WeatherSubclass
    
    
    /// Empty weather state
    /// - Returns: <#description#>
    static func empty() -> WeatherResponse {
        return WeatherResponse(current: WeatherSubclass())
    }
}
