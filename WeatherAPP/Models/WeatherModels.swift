//
//  WeatherModels.swift
//  WeatherAPP
//
//  Created by Madina Abdulgafar on 11.04.2025.
//

import Foundation

struct CurrentWeather: Decodable {
    let temp: Double
    let weather: [WeatherCondition]
    
    struct WeatherCondition: Decodable {
        let description: String
        let icon: String
    }
}

struct Forecast: Decodable {
    let list: [ForecastEntry]
    
    struct ForecastEntry: Decodable {
        let dt_txt: String
        let main: Main
        struct Main: Decodable {
            let temp: Double
        }
    }
}

struct AirQuality: Decodable {
    let list: [AQEntry]
    
    struct AQEntry: Decodable {
        let main: Main
        struct Main: Decodable {
            let aqi: Int
        }
    }
}
