//
//  MainView.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 22.03.2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    @State var isLoaded = false
    
    @ViewBuilder
    var body: some View {
        NavigationStack {
            if isLoaded {
                VStack {
                    TodayWeatherView()
                    HoursTodayeWeather()
                    DaysWeatherView()
                }
                .environmentObject(viewModel)
                .background(
                    Color(red: 0.29, green: 0.56, blue: 0.89)
            )
            } else {
                ProgressView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                            self.isLoaded = true
                        }
                    }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(WeatherViewModel())
    }
}
