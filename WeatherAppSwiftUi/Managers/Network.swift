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
    func getTodayWeather(lat: Double,lon: Double, completion: @escaping(Result<WeatherModel,AFError>)->Void) {
        let url = "\(NetworkConfiguration.api_url)onecall?lat=\(lat)&lon=\(lon)&units=metric&exclude=current&appid=\(NetworkConfiguration.api_key)"
        downloadJSON(url: url, completion: completion)
        print(url, "today")
        
    }
    
    func getCurrentWeather(lat:Double,lon:Double, completion: @escaping(Result<CurrentWeather,AFError>)-> Void) {
        let url = "\(NetworkConfiguration.api_url)weather?lat=\(lat)&lon=\(lon)&appid=\(NetworkConfiguration.api_key)&units=metric"
        downloadJSON(url: url, completion: completion)
        print(url, "current")
    }

    private func downloadJSON<T:Decodable>(url: String, completion: @escaping(Result<T,AFError>)-> Void) {
        guard let url = URL(string: url) else { return }
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
