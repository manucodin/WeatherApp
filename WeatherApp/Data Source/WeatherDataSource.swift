//
//  WeatherDataSource.swift
//  WeatherApp
//
//  Created by Manuel Rodriguez Sebastian on 17/3/23.
//

import Foundation
import CoreLocation
import Moya

class WeatherDataSource {
    private let provider = MoyaProvider<WeatherAPI>()
    
    func fetchWeather(location: CLLocation) async throws -> Weather {
        try await withCheckedThrowingContinuation { continuation in
            provider.request(.currentWeather(lat: location.coordinate.latitude, lon: location.coordinate.longitude)) { result in
                switch result {
                case .success(let response):
                    do {
                        let weatherInfo = try JSONDecoder().decode(Weather.self, from: response.data)
                        continuation.resume(returning: weatherInfo)
                    } catch let error {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
