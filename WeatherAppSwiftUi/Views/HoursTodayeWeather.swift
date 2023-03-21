//
//  HoursTodayeWeather.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 21.03.2023.
//

import SwiftUI

struct HoursTodayeWeather: View {
//    let hours = [1,2,3,4,5,6,7,]
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(1..<25) { content in
//                    Text("\(content)")
                    HourCell()
                }
            }
        }
        .background(
            Color(red: 0.36, green: 0.62, blue: 0.94)
        )
    }
}

struct HoursTodayeWeather_Previews: PreviewProvider {
    static var previews: some View {
        HoursTodayeWeather()
    }
}


struct HourCell: View {
    
    var body: some View {
        VStack {
            Text("17 00")
            Image(systemName: "cloud")
            Text("27")
        }
        .frame(width: 60,height: 150)
    }
}
