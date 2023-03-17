//
//  ContentView.swift
//  WeatherApp
//
//  Created by Manuel Rodriguez Sebastian on 17/3/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            List (viewModel.weathersInfo) { weather in
                WeatherInfoView(weatherInfo: weather)
            }
            .listStyle(.plain)
            .navigationTitle("Weather")
            .navigationBarTitleDisplayMode(.inline)
        }.onAppear {
            Task {
                await viewModel.fetchWeatherInfo()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
