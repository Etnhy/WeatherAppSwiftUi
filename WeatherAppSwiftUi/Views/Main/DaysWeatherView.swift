//
//  DaysWeatherView.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import SwiftUI

struct DaysWeatherView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.setDaily(),id: \.id) { content in
                    DaysCell(content: content)
                }
            }
        }
        .background(
            Color.white
        )
    }
}

struct DaysWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DaysWeatherView()
            .environmentObject(WeatherViewModel())
    }
}


struct DaysCell: View {
    var content: Daily
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text("\(Double(content.dt).getDateStringFromUnixTime(dateStyle: .full, timeStyle: .none, format: "E"))")
            Spacer()
            Text("\(Int(content.temp.max))°C / \(Int(content.temp.min))°C")
            Spacer()
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(content.weather[0].icon)@2x.png")) { image in
                image.frame(width: 70,height: 70)
                    .frame(alignment: .leading)
            } placeholder: {
                ProgressView()
                    .frame(width: 70,height: 70)
            }
            Spacer()
        }

        .font(.custom(AvenirFont.avenirMedium, size: 20))
        .frame(height: 100)
    }
}