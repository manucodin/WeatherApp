//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by Manuel Rodriguez Sebastian on 17/3/23.
//

import Foundation
import Moya

enum Units: String {
    case standard
    case metric
    case imperial
}

enum WeatherAPI {
    case currentWeather(lat: Double, lon: Double, units: Units = .metric)
}

extension WeatherAPI: TargetType {
    var baseURL: URL { return URL(string: "https://api.openweathermap.org/data/2.5/weather")! }
    
    var path: String {
        switch self {
        case .currentWeather: return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .currentWeather: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .currentWeather(let lat, let lon, let units):
            return .requestParameters(
                parameters: ["lat": lat, "lon": lon, "units": units.rawValue, "appid": "c8793a83a75058a4de234d82118c2b26"],
                encoding: URLEncoding.queryString
            )
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
