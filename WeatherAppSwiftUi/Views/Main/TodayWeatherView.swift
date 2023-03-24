//
//  TodayWeatherView.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import SwiftUI
import Nuke
import NukeUI

struct TodayWeatherView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    @EnvironmentObject var location: LocationManager

    var body: some View {
        VStack {
            HStack {
                Toggle("", isOn: $viewModel.coordinateWeatherOrMapTappint)
                if !viewModel.coordinateWeatherOrMapTappint {
                    Spacer()

                    NavigationLink(destination: SelectLocationView()) {
                        Image(systemName: "location.circle")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30,height: 30)
                    }
                    .environmentObject(WeatherViewModel())
                } else {
                    Spacer()

                    Button {
                        viewModel.getWeatherData(location:                      location.locationManager(location.locationManager, didUpdateLocations: [location.locationManager.location!]))
                    } label: {
                        Image(systemName: "gobackward")
                            .resizable()
                            .frame(width: 30,height: 30)
                    }

                }

            }.padding(.horizontal,16)
            VStack {
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
                        .foregroundColor(.black)

                        .padding(.horizontal, 16)
                        Spacer()
                        
                    }

                    HStack {
                        LazyImage(source: viewModel.returnCurrentIcon()) { image in
                            image.image?
                                .resizingMode(.aspectFit)
                        }
                        .frame(width:160,height: 160)
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
                        .foregroundColor(.black)

                        Spacer()
                    }
                }
                .padding(.horizontal,16)
                .frame(height: 300)

            }
        }
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
