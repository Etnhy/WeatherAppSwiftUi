//
//  WeatherAppSwiftUiApp.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import SwiftUI

@main
struct WeatherAppSwiftUiApp: App {
    @State private var isLoading = false
    
    @ViewBuilder
    var body: some Scene {
        
        WindowGroup {
            if isLoading {
                MainView()
                    .environmentObject(WeatherViewModel())
            } else {
                LoadingView(isLoading: $isLoading)
                    .environmentObject(WeatherViewModel())

            }
        }

        
    }
}
