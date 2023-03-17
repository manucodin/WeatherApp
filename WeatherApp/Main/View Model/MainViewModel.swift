//
//  MainViewModel.swift
//  WeatherApp
//
//  Created by Manuel Rodriguez Sebastian on 17/3/23.
//

import Foundation
import Combine
import CoreLocation

class MainViewModel: ObservableObject {
    
    @Published var weathersInfo = [Weather]()

    private let madridLocation = CLLocation(latitude: 40.416729, longitude: -3.703339)
    private let barcelonaLocation = CLLocation(latitude: 41.3887900, longitude: 2.1589900)
    private let sevillaLocation = CLLocation(latitude: 37.3828300, longitude: -5.9731700)
    
    private let dataSource = WeatherDataSource()
    
    @MainActor
    func fetchWeatherInfo() async {
        do {
            async let fetchedMadridInfo = dataSource.fetchWeather(location: madridLocation)
            async let fetchedBarcelonaInfo = dataSource.fetchWeather(location: barcelonaLocation)
            async let fetchedSevillaInfo = dataSource.fetchWeather(location: sevillaLocation)
            
            var madridInfo = try await fetchedMadridInfo
            weathersInfo.append(madridInfo.setCountry(country: "Madrid"))

            var barcelonaInfo = try await fetchedBarcelonaInfo
            weathersInfo.append(barcelonaInfo.setCountry(country: "Barcelona"))

            var sevillaInfo = try await fetchedSevillaInfo
            weathersInfo.append(sevillaInfo.setCountry(country: "Sevilla"))            
        } catch let error {
            debugPrint(error)
        }
    }
}
