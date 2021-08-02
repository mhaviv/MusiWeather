//
//  WeatherResponse.swift
//  MusiWeather
//
//  Created by Michael Haviv on 8/1/21.
//

import Foundation

struct WeatherResponse: Decodable {
    let lat: Double
    let lon: Double
    let timezone: String
    let timezoneOffset: Int
    var current: CurrentWeather
    
    enum CodingKey: String {
        case lat
        case lon
        case timezone
        case timezoneOffset = "timezone_offset"
        case current
    }
}


struct CurrentWeather: Decodable {
    var dt: Int
    var sunrise: Int
    var sunset: Int
    var temp: Double
    var feels_like: Double
    var pressure: Double
    var humidity: Int
    var dew_point: Double
    var uvi: Int
    var clouds: Int
    var visibility: Int
    var wind_speed: Double
    var wind_deg: Int
    var wind_gust: Double
    var weather: [Weather]
    
    enum CodingKey: String {
        case date = "dt"
        case sunrise
        case sunset
        case temp
        case feelsLike = "feel_like"
        case pressure
        case humidity
        case dewPoint = "dew_point"
        case uvi
        case clouds
        case visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather
    }
}

struct Weather: Decodable, Identifiable {
    var id: UUID
    var main: String
    var description: String
    var icon: String
}

struct MockData {
    static let sampleCurrentWeather = WeatherResponse(lat: 40.574268,
                                                      lon: -74.609879,
                                                      timezone: "America/New_York",
                                                      timezoneOffset: -14400,
                                                      current: CurrentWeather(
                                                        dt: 1627877097,
                                                        sunrise: 1627898194,
                                                        sunset: 1627949561,
                                                        temp: 291.58,
                                                        feels_like: 291.96,
                                                        pressure: 1011,
                                                        humidity: 95,
                                                        dew_point: 290.76,
                                                        uvi: 0,
                                                        clouds: 75,
                                                        visibility: 8047,
                                                        wind_speed: 0.89,
                                                        wind_deg: 260,
                                                        wind_gust: 1.79,
                                                        weather: [Weather(
                                                            id: UUID(),
                                                            main: "Mist",
                                                            description: "mist",
                                                            icon: "50n")]))
}
