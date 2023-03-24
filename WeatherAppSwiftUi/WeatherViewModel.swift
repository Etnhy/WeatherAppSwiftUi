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
    @Published var coordinateWeatherOrMapTappint: Bool = true
    
    @Published var mapDefaultCoordinate = CLLocationCoordinate2D(latitude: 50.450001, longitude: 30.523333)

    
    public func getWeatherData(location: CLLocationCoordinate2D?) {
        guard let location = location else { return }
        print(location, "VIEW MODEL")
        getCurrentWeather(lat: location.latitude, lon: location.longitude)
        getWeather(lat: location.latitude, lon: location.longitude)
    }
    
    public func mapOrSelf(location: CLLocationCoordinate2D?) {
        if coordinateWeatherOrMapTappint {
            getWeatherData(location: location)
        } else {
            getWeatherData(location: location)

        }
//        print(coordinateWeatherOrMapTappint)
    }
    
    func returnWindSpeedCurrent()-> String {
        guard let currentWeather = self.currentWeather else { return "" }
        return "\(Int(currentWeather.wind.speed))/sec"
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
