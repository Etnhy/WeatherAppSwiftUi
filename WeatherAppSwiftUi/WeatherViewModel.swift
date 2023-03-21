//
//  WeatherViewModel.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import Foundation

class WeatherViewModel: ObservableObject {
    let network = Network()
    
    
    func get() {
        network.getTodayWeather(city: "") { res in
            switch res {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
