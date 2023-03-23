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
    @StateObject var vm = WeatherViewModel()
    
    @ViewBuilder
    var body: some Scene {
        
        WindowGroup {
            MainView()
                .environmentObject(vm)
                .onAppear {
                    vm.getWeatherData()
                }
        }
        
        
    }
}
