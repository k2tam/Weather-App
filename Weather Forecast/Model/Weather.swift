//
//  Weather.swift
//  Weather Forecast
//
//  Created by k2 tam on 02/09/2022.
//

import Foundation


struct Weather: Decodable{
    var current: CurrentWeather
    var hourly: [CurrentWeather]
}

struct CurrentWeather: Decodable {
    var temp: Double
    var temp_far: Double {ConversionHelper.celciusToFahr(temp: temp)}
    var feels_like: Double
    var feels_like_far: Double {ConversionHelper.celciusToFahr(temp: feels_like)}
    var weather: [WeatherData]
}


struct WeatherData: Decodable{
    var description: String
    var icon: String
}
