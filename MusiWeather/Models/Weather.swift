//
//  Weather.swift
//  MusiWeather
//
//  Created by Michael Haviv on 6/28/21.
//

import Foundation

// Need Identifiable to recognize each record individually
class Weather: Codable, Identifiable {
    var dt: Int
    var temp: Double
    var feels_like: Double
    var pressure: Double
    var humidity: Int
    var dew_point: Double
    var clouds: Int
    var wind_speed: Double
    var wind_deg: Int
    var weather: [WeatherDetail]
    
    enum CodingKey: String {
        case date = "dt"
        case temp
        case feelsLike = "feel_like"
        case pressure
        case humidity
        case dewPoint = "dew_point"
        case clouds
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
    
    // Initialize zero state
    init() {
        dt = 0
        temp = 0.0
        feels_like = 0.0
        pressure = 0.0
        humidity = 0
        dew_point = 0.0
        clouds = 0
        wind_speed = 0.0
        wind_deg = 0
        weather = []
    }
}

extension Weather {
    var id: UUID {
        return UUID()
    }
}

class WeatherSubclass: Weather {
    var sunset: Int = 0
    var sunrise: Int = 0
    
}
