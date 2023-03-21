//
//  TodayWeatherView.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import SwiftUI

struct TodayWeatherView: View {
    @EnvironmentObject var viewModel: WeatherViewModel

    var body: some View {
            VStack {
                HStack(alignment: .firstTextBaseline) {
                    VStack {
                        Text(viewModel.currentWeather?.name ?? "error")
                            .font(.custom(AvenirFont.avenirHeavy, size: 22))
                        HStack {
                            Text(.now, style: .date)
                                .font(.custom(AvenirFont.avenirMedium, size: 19))
                        }
                    }
                    .padding(.horizontal, 16)
                    Spacer()
                    NavigationLink(destination: MapView()) {
                        Image(systemName: "location.circle")
                    }

                    

                }
                HStack {
                    AsyncImage(url:URL(string: viewModel.returnCurrentIcon())) { img in
                        img.frame(width: 160,height: 160)
                    } placeholder: {
                        ProgressView {
                            Text("Loading")
                        }
                        .padding(.horizontal,16)
                    }
                    .frame(width: 160,height: 160)

                     
                    Spacer()
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "thermometer.low")
                            Text(viewModel.returnMinMaxCurrentTemp())
                        }
                        HStack {
                            Image(systemName: "drop.fill")
                            Text(viewModel.returnHumidityCurrent())
                        }
                        HStack {
                            Image(systemName: "wind")
                            Text(viewModel.returnWindSpeedCurrent())
                        }
                    }
                    .font(.custom(AvenirFont.avenirMedium, size: 18))
                    Spacer()
                }
            }
            .padding(.horizontal,16)
        .frame(height: 300)
        }
}

struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TodayWeatherView()
            .environmentObject(WeatherViewModel())
    }
}

enum AvenirFont {
    static let avenirHeavy = "AvenirNext-HeavyItalic"
    static let avenirMedium = "AvenirNext-Medium"
}
