//
//  WeatherInfoView.swift
//  WeatherApp
//
//  Created by Manuel Rodriguez Sebastian on 17/3/23.
//

import SwiftUI

struct WeatherInfoView: View {
    
    var weatherInfo: Weather
    
    var body: some View {
        ZStack {
            Image(weatherInfo.backgroundImage).resizable()
            Color(.black).opacity(0.3)
            VStack (spacing: 4){
                HStack (alignment: .bottom){
                    Text(weatherInfo.formattedCountryName).font(.title).foregroundColor(.white)
                    Text(weatherInfo.formattedTemperature).font(.title2).foregroundColor(.white)
                    Spacer()
                    VStack (alignment: .trailing){
                        Text(weatherInfo.formattedMinTemperature).font(.callout).foregroundColor(.white)
                        Text(weatherInfo.formattedMaxTemperature).font(.callout).foregroundColor(.white)
                    }
                }
                HStack {
                    Text("Soleado").font(.subheadline).foregroundColor(.white)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text(weatherInfo.formattedHumidity).font(.subheadline).foregroundColor(.white)
                }
            }.padding()
        }.frame(height: 100.0).cornerRadius(5)
    }
}

struct WeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoView(weatherInfo: Weather())
            .previewLayout(.sizeThatFits)
        
    }
}
