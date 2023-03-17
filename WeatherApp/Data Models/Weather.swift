//
//  Weather.swift
//  WeatherApp
//
//  Created by Manuel Rodriguez Sebastian on 17/3/23.
//

import Foundation
import UIKit

struct Weather: Codable, Identifiable{
    var country: String?
    let coord: Coord?
    let weather: [WeatherElement]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let rain: Rain?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let timezone, id: Int?
    let name: String?
    let cod: Int?
    
    var formattedCountryName: String {
        return country ?? ""
    }
    
    var formattedTemperature: String {
        guard let temperature = main?.temp else { return "-" }
        
        return "\(temperature)°C"
    }
    
    var formattedMinTemperature: String {
        guard let minTemperature = main?.tempMin else { return "-" }
    
        return "min \(minTemperature)°C"
    }
    
    var formattedMaxTemperature: String {
        guard let maxTemperature = main?.tempMax else { return "-" }
    
        return "max \(maxTemperature)°C"
    }
    
    var formattedHumidity: String {
        guard let humidity = main?.humidity else { return "-" }
        
        return "Humedad: \(humidity)%"
    }
    
    var backgroundImage: String {
        guard let currentWeatherImage = weather?.first?.main?.lowercased() else { return "sunny" }
        
        return currentWeatherImage
    }
    
    init(country: String? = nil, coord: Coord? = nil, weather: [WeatherElement]? = nil, base: String? = nil, main: Main? = nil, visibility: Int? = nil, wind: Wind? = nil, rain: Rain? = nil, clouds: Clouds? = nil, dt: Int? = nil, sys: Sys? = nil, timezone: Int? = nil, id: Int? = nil, name: String? = nil, cod: Int? = nil) {
        self.country = country
        self.coord = coord
        self.weather = weather
        self.base = base
        self.main = main
        self.visibility = visibility
        self.wind = wind
        self.rain = rain
        self.clouds = clouds
        self.dt = dt
        self.sys = sys
        self.timezone = timezone
        self.id = id
        self.name = name
        self.cod = cod
    }
    
    mutating func setCountry(country: String) -> Weather {
        self.country = country
        return self
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int?
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double?
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity, seaLevel, grndLevel: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the1H: Double?

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int?
    let country: String?
    let sunrise, sunset: Int?
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let id: Int?
    let main, description, icon: String?
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}
