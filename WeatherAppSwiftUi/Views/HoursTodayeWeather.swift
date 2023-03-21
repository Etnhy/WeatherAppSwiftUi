//
//  HoursTodayeWeather.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import SwiftUI

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
        }
        .background(
            Color(red: 0.36, green: 0.62, blue: 0.94)
        )
        .frame(height: 170)
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
    var body: some View {
        VStack(alignment: .center) {
            Text("\(Date(timeIntervalSince1970: TimeInterval(time)).formatted(date: .omitted, time: .shortened))")
                .font(.custom(AvenirFont.avenirMedium, size: 13))
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(image)@2x.png")) { image in
                image.frame(width:50, height: 50)
            } placeholder: {
                ProgressView {
                    Text("Loading")
                }
                .frame(width: 50,height: 50)
            }
            Text("\(Int(temp))°C")
        }
        .frame(width: 60,height: 170)
    }
}
