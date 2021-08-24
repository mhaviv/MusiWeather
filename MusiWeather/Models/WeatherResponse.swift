//
//  WeatherResponse.swift
//  MusiWeather
//
//  Created by Michael Haviv on 8/1/21.
//

import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let lat, lon: Double
    let timezone: String
    let timezoneOffset: Int
    let current: Current
    let alerts: [WeatherAlert]?

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, alerts
    }
    
    static func empty() -> WeatherResponse {
        return WeatherResponse(lat: 0.0,
                               lon: 0.0,
                               timezone: "",
                               timezoneOffset: 0,
                               current: Current(
                                 dt: 0,
                                 sunrise: 0,
                                 sunset: 0,
                                temp: 0.0,
                                feelsLike: 0.0,
                                 pressure: 0,
                                 humidity: 0,
                                dewPoint: 0.0,
                                 uvi: 0,
                                 clouds: 0,
                                 visibility: 0,
                                 windSpeed: 0,
                                 windDeg: 0,
                                windGust: 0.0,
                                 weather: [Weather(
                                     id: 0,
                                     main: "",
                                     weatherDescription: "",
                                            icon: "")]), alerts: [WeatherAlert(senderName: "", event: "", start: 0, end: 0, alertDescription: "", tags: [])])
        }
}

// MARK: - Alert
struct WeatherAlert: Codable {
    let senderName, event: String
    let start, end: Int
    let alertDescription: String
    let tags: [String]

    enum CodingKeys: String, CodingKey {
        case senderName = "sender_name"
        case event, start, end
        case alertDescription = "description"
        case tags
    }
}

// MARK: - CurrentWeather
struct Current: Codable {
    let dt, sunrise, sunset: Int
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint: Double
    let uvi, clouds, visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let windGust: Double?
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - MockData
struct MockData {
    static let sampleCurrentWeather = WeatherResponse(lat: 40.574268,
                                                      lon: -74.609879,
                                                      timezone: "America/New_York",
                                                      timezoneOffset: -14400,
                                                      current: Current(
                                                        dt: 1627877097,
                                                        sunrise: 1627898194,
                                                        sunset: 1627949561,
                                                        temp: 291.58,
                                                        feelsLike: 291.96,
                                                        pressure: 1011,
                                                        humidity: 95,
                                                        dewPoint: 290.76,
                                                        uvi: 0,
                                                        clouds: 75,
                                                        visibility: 8047,
                                                        windSpeed: 0,
                                                        windDeg: 260,
                                                        windGust: 1.79,
                                                        weather: [Weather(
                                                            id: 0001,
                                                            main: "Mist",
                                                            weatherDescription: "mist",
                                                                    icon: "50n")]), alerts: [WeatherAlert(senderName: "NWS Philadelphia - Mount Holly (New Jersey, Delaware, Southeastern Pennsylvania)", event: "Flood Warning", start: 1629767820, end: 1629806400, alertDescription: "...The Flood Warning is extended for the following rivers in New\nJersey...\nRockaway River At Boonton Below Resvr affecting Morris County.\n...The Flood Warning continues for the following rivers in New\nJersey...\nNorth Branch Rancocas Creek At Pemberton affecting Burlington\nCounty.\nRaritan River At Manville affecting Somerset and Middlesex\nCounties.\nRaritan River At Bound Brook affecting Somerset and Middlesex\nCounties.\nMillstone River At Blackwells Mills affecting Somerset County.\nPassaic River Above Singac affecting Morris, Essex, and Passaic\nCounties.\nPassaic River At Pine Brook affecting Morris, Essex, and Passaic\nCounties.\nFor the Passaic River...including Millington, Chatham, Pine Brook,\nSingac, Little Falls...Moderate flooding is forecast.\nFld   Observed           Forecasts (8 pm EDT)\nLocation     Stg   Stg   Day/Time     Tue   Wed   Thu\nRaritan River\nManville     14.0  16.6  Mon 8 pm EDT 7.7   5.7   MSG\n&&", tags: ["Flood"])])
}
