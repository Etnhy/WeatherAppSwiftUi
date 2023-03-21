//
//  ContentView.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    var body: some View {
        NavigationStack {
            VStack {
                TodayWeatherView()
                HoursTodayeWeather()
                DaysWeatherView()
            }
            .environmentObject(viewModel)
            .onAppear(perform: {
                viewModel.getWeatherData(lat: "33.44", lon: "-94.04")
            })
            .background(
                Color(red: 0.29, green: 0.56, blue: 0.89)
        )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(WeatherViewModel())
    }
}
