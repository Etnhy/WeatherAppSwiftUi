//
//  WeatherModel.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import Foundation

struct WeatherModel: Codable {
    let weather: [Weather]
    let main: MainTemp
    let wind: Wind
    let name: String
}
struct Weather:Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
struct MainTemp:Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    
}
struct Wind: Codable {
    let speed: Double
}
/*
 {
     "coord": {
         "lon": 30.5167,
         "lat": 50.4333
     },
     "weather": [
         {
             "id": 500,
             "main": "Rain",
             "description": "light rain",
             "icon": "10d"
         }
     ],
     "base": "stations",
     "main": {
         "temp": 12.51,
         "feels_like": 11.46,
         "temp_min": 12.51,
         "temp_max": 12.51,
         "pressure": 1013,
         "humidity": 63,
         "sea_level": 1013,
         "grnd_level": 997
     },
     "visibility": 10000,
     "wind": {
         "speed": 3.96,
         "deg": 280,
         "gust": 5.18
     },
     "rain": {
         "1h": 0.26
     },
     "clouds": {
         "all": 53
     },
     "dt": 1679398458,
     "sys": {
         "country": "UA",
         "sunrise": 1679371178,
         "sunset": 1679415050
     },
     "timezone": 7200,
     "id": 703448,
     "name": "Kyiv",
     "cod": 200
 }
 */
