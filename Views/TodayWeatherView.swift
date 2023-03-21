//
//  TodayWeatherView.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import SwiftUI

struct TodayWeatherView: View {
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                VStack {
                    Text("Название города")
                        .font(.custom(AvenirFont.avenirHeavy, size: 22))
                    HStack {
                        Text("дата")
                            .font(.custom(AvenirFont.avenirMedium, size: 19))
                    }
                }
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
    static var previews: some View {
        TodayWeatherView()
    }
}

enum AvenirFont {
    static let avenirHeavy = "AvenirNext-HeavyItalic"
    static let avenirMedium = "AvenirNext-Medium"
}
