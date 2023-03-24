//
//  HoursTodayeWeather.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import SwiftUI
import NukeUI

struct HoursTodayeWeather: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    
    @ViewBuilder
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.setHourly(),id: \.id) { content in
                    HourCell(time: content.dt, image: content.weather[0].icon, temp: content.temp)
                }
            }
            .padding(.horizontal,16)
            .frame(height: 170)

        }
        .background(
            Color(red: 0.36, green: 0.62, blue: 0.94)
        )
    }
}

struct HoursTodayeWeather_Previews: PreviewProvider {
    static var previews: some View {
        HoursTodayeWeather()
            .environmentObject(WeatherViewModel())
    }
}


struct HourCell: View {
    @State var time: Int
    @State var image: String
    @State var temp: Double
    
//    var hourly: Hourly
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("\(Date(timeIntervalSince1970: TimeInterval(time)).formatted(date: .omitted, time: .shortened))")
                .font(.custom(AvenirFont.avenirMedium, size: 13))
            Spacer()

            LazyImage(source: "https://openweathermap.org/img/wn/\(image)@2x.png") { image in
                image.image?.frame(width: 60,height: 60)
            }
            Spacer()

            Text("\(Int(temp))°C")
            Spacer()

        }
        .foregroundColor(.black)

        .padding(.vertical,16)
        .frame(width: 60,height: 170)
        
    }
}
