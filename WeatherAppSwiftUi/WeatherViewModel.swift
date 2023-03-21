//
//  WeatherViewModel.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weatherModel: WeatherModel?
    @Published var currentWeather: CurrentWeather?
    
    // °C
    
    public func getWeatherData(lat: String, lon: String) {
        getCurrentWeather(lat: lat, lon: lon)
        getWeather(lat: lat, lon: lon)
    }
    
   private func getWeather(lat: String, lon: String) {
        Network.shared.getTodayWeather(lat: lat, lon: lon) { res in
            switch res {
            case .success(let success):
                print(success)
                print(success.hourly.count)
                self.weatherModel = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
   private func getCurrentWeather(lat: String, lon: String) {
        Network.shared.getCurrentWeather(lat: lat, lon: lon) { result in
            switch result {
            case .success(let success):
                print(success)
                self.currentWeather = success
            case .failure(let failure):
                print(failure)
            }
        }
        
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
 
}
