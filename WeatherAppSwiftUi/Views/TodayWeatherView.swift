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
                    Text("Название города")
                        .font(.custom(AvenirFont.avenirHeavy, size: 22))
                    HStack {
                        Text(.now, style: .date)
                            .font(.custom(AvenirFont.avenirMedium, size: 19))
                    }
                }
                .padding(.horizontal, 16)
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "location.circle")
                }
            }
            HStack {
                Image(systemName: "cloud.rain.fill")
                    .resizable()
                    .frame(width: 140,height: 140)
                /*
                 let url = viewModel.weatherModel?.weather.first?.icon ?? "error"
                AsyncImage(url:URL(string: "https://openweathermap.org/img/wn/\(url)@2x.png")) { img in
                    img.frame(width: 160,height: 160)
                } placeholder: {
                    ProgressView {
                        Text("Loading")
                    }
                    .padding(.horizontal,16)
                }
                .frame(width: 160,height: 160)

                 */
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "thermometer.low")
                        Text("27/19")
                    }
                    HStack {
                        Image(systemName: "drop.fill")
                        Text("33 %")
                    }
                    HStack {
                        Image(systemName: "wind")
                        Text("5м/сек")
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
//    @State static var weatherPreviewsModel:WeatherModel?
    
    static var previews: some View {
        TodayWeatherView()
            .environmentObject(WeatherViewModel())
    }
}

enum AvenirFont {
    static let avenirHeavy = "AvenirNext-HeavyItalic"
    static let avenirMedium = "AvenirNext-Medium"
}
