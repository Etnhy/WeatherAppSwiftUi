//
//  MainView.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 22.03.2023.
//

import SwiftUI

struct MainView: View {
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
                viewModel.getWeatherData(lat: viewModel.location.latitude, lon: viewModel.location.longitude)
            })
            .background(
                Color(red: 0.29, green: 0.56, blue: 0.89)
            )
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(WeatherViewModel())
    }
}
