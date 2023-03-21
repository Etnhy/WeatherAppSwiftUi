//
//  DaysWeatherView.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import SwiftUI

struct DaysWeatherView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(1..<8) { content in
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
    }
}


struct DaysCell: View {
    var content: Int
    var body: some View {
        HStack {
            Text("\(content)")
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
