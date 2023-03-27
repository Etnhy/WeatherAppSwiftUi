//
//  MainView.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 22.03.2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    @EnvironmentObject var location: LocationManager
    @State var isLoaded = false
    

    @ViewBuilder
    var body: some View {
        NavigationStack {
                VStack {
                    TodayWeatherView()
                    HoursTodayeWeather()
                    DaysWeatherView()
                }
                .onAppear(perform: {
                    location.startUpdatingLocation()
                    
                   if viewModel.coordinateWeatherOrMapTappint {
                       guard let loc = location.locationManager.location else { return }
                       viewModel.getWeatherData(
                        location: location.locationManager(location.locationManager, didUpdateLocations: [loc]))
                    } else {
                        viewModel.getWeatherData(location: viewModel.mapDefaultCoordinate)
                    }
                })
                .environmentObject(viewModel)
                .environmentObject(location)
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
