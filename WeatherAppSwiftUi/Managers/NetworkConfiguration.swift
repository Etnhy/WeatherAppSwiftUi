//
//  NetworkConfiguration.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 27.03.2023.
//

import Foundation

enum NetworkConfiguration {
    
    static let api_key: String = {
        guard let api = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError()
        }
        return "\(api)"
    }()
    
    static let api_url: String = {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "API_URL") as? String else {
            fatalError()
        }
        return "\(url)"
    }()
}
