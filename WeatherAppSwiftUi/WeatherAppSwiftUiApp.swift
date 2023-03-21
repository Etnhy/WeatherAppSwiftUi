//
//  WeatherAppSwiftUiApp.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import SwiftUI

@main
struct WeatherAppSwiftUiApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(WeatherViewModel())
        }
    }
}
