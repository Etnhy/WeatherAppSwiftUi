//
//  Network.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import Foundation
import Alamofire


class Network {
    static let shared = Network()
    /*
     https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=current&appid=9e64db94a738a9d0398f267a443b079c
     
     https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=current&appid=9e64db94a738a9d0398f267a443b079c
     */
    func getTodayWeather(lat: String,lon: String, completion: @escaping(Result<WeatherModel,AFError>)->Void) {
        let url = "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&units=metric&exclude=current&appid=9e64db94a738a9d0398f267a443b079c"
        downloadJSON(url: url, completion: completion)
    } // https://api.openweathermap.org/data/2.5/weather?lat=33.44&lon=-94.04&appid=9e64db94a738a9d0398f267a443b079c&units=metric
    
    func getCurrentWeather(lat:String,lon:String, completion: @escaping(Result<CurrentWeather,AFError>)-> Void) {
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=9e64db94a738a9d0398f267a443b079c&units=metric"
        downloadJSON(url: url, completion: completion)
        
    }

    private func downloadJSON<T:Decodable>(url: String, completion: @escaping(Result<T,AFError>)-> Void) {
        print("START")
        guard let url = URL(string: url) else { return }
        print(url)
        AF.request(url,method: .get,encoding: JSONEncoding.default,requestModifier: {JSONresponse in
            JSONresponse.timeoutInterval = 10
        }).validate(statusCode: 200..<201).responseDecodable(of: T.self) { responseDecodable in
            switch responseDecodable.result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
