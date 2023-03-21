//
//  WeatherViewModel.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import Foundation

class WeatherViewModel: ObservableObject {
//    let network = Network()
    
    @Published var weatherModel: WeatherModel?
    
    func getWeather() {
        Network.shared.getTodayWeather(city: "") { res in
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
