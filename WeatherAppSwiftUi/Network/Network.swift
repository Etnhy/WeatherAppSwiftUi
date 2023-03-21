//
//  Network.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import Foundation
import Alamofire


class Network {
    
    //https://api.openweathermap.org/data/2.5/weather?q=Kyiv&units=metric&appid=9e64db94a738a9d0398f267a443b079c
    
    func getTodayWeather(city: String, completion: @escaping(Result<WeatherModel,AFError>)->Void) {
        let url = "https://api.openweathermap.org/data/2.5/weather?q=Kyiv&units=metric&appid=9e64db94a738a9d0398f267a443b079c"
        downloadJSON(url: url, completion: completion)
    }
    
    
    private func downloadJSON<T:Decodable>(url: String, completion: @escaping(Result<T,AFError>)-> Void) {
        guard let url = URL(string: url) else { return }
        AF.request(url,method: .get,encoding: JSONEncoding.default,requestModifier: {JSONresponse in
            JSONresponse.timeoutInterval = 10
        }).validate(statusCode: 200..<201).responseDecodable(of: T.self) { responseDecodable in
            switch responseDecodable.result {
                
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}
