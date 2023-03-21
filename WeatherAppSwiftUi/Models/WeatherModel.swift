//
//  WeatherModel.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import Foundation

struct WeatherModel: Codable {
    let lat: Double
    let lon: Double
    let timezone: String
    let hourly: [Hourly]
    let daily: [Daily]
    

}

 //MARK: - hourly
struct Hourly: Codable, Identifiable {
    let id = UUID()
    let dt: Int
    let temp: Double
    let weather: [Weather]
    
    enum CodingKeys: CodingKey {
        case dt
        case temp
        case weather
    }
}
struct Weather: Codable {
    let id: Int
    let main: String
    let icon: String
}
 //MARK: -  daily
struct Daily: Codable, Identifiable {
    let id = UUID()
    
    let dt: Int
    let temp: Temp
    let weather: [Weather]
    enum CodingKeys: CodingKey {
        case id
        case dt
        case temp
        case weather
    }
}

struct Temp: Codable {
    let day: Double
    let min: Double
    let max: Double
}

