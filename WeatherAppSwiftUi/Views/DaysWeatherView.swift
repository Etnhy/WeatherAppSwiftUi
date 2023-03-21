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
        HStack {
//            Text(Date(timeIntervalSince1970: TimeInterval(content.dt)), format: .dateTime)
            Text("\(Double(content.dt).getDateStringFromUnixTime(dateStyle: .full, timeStyle: .none, format: "E"))")
            Spacer()
            Text("27 / 19")
            Spacer()
            Image(systemName: "cloud")
                .resizable()
                .frame(width: 50,height: 40)
        }
        .font(.custom(AvenirFont.avenirMedium, size: 20))
        .frame(height: 100)
        .padding(.horizontal,16)
    }
}
