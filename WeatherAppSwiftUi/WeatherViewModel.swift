//
//  WeatherViewModel.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import Foundation
import MapKit

class WeatherViewModel: ObservableObject {
    @Published var weatherModel: WeatherModel?
    @Published var currentWeather: CurrentWeather?
    //                viewModel.getWeatherData(lat: "47.54", lon: "33.22")

    @Published var location = CLLocationCoordinate2D(latitude: 50.450001, longitude: 30.523333)
    
    public func getWeatherData(lat: Double, lon: Double) {
        getCurrentWeather(lat: lat, lon: lon)
        getWeather(lat: lat, lon: lon)
    }
    

    
    func returnWindSpeedCurrent()-> String {
        guard let currentWeather = self.currentWeather else { return "" }
        return "\(Int(currentWeather.wind.speed))/сек"
    }
    
    func returnHumidityCurrent() -> String {
        guard let currentWeather = self.currentWeather else { return "" }
        return "\(currentWeather.main.humidity.formatted(.percent))"
    }
    func returnMinMaxCurrentTemp() -> String {
        guard let currentWeather = self.currentWeather else { return "" }
        return "\(Int(currentWeather.main.temp_min))°C / \(Int(currentWeather.main.temp_max))°C"
    }
    
    
    func returnCurrentIcon()-> String {
        guard let currentWeather = self.currentWeather else { return "" }
        return  "https://openweathermap.org/img/wn/\(currentWeather.weather[0].icon)@2x.png"
    }
    
    func setHourly() -> [Hourly] {
        if let weatherModel = self.weatherModel {
            return weatherModel.hourly
        }
        return []
    }
    
    func setDaily() -> [Daily] {
        if let weatherModel = self.weatherModel {
            return weatherModel.daily
        }
        return []
    }
     //MARK: -  get weather
    private func getWeather(lat: Double, lon: Double) {
         Network.shared.getTodayWeather(lat: lat, lon: lon) { res in
             switch res {
             case .success(let success):
                 self.weatherModel = success
             case .failure(let failure):
                 print(failure)
             }
         }
     }
    
    func setCurrentWeahter() -> CurrentWeather {
        if let currentWeather = self.currentWeather {
            return currentWeather
        }
        fatalError()
    }
    
    private func getCurrentWeather(lat: Double, lon: Double) {
         Network.shared.getCurrentWeather(lat: lat, lon: lon) { result in
             switch result {
             case .success(let success):
                 self.currentWeather = success
             case .failure(let failure):
                 print(failure)
             }
         }
         
     }
 
}
