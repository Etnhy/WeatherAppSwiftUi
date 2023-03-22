//
//  LoadingView.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 22.03.2023.
//

import SwiftUI

struct LoadingView: View {
    @Binding var isLoading: Bool
    @State var timeAmount = 0.0
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            
            ProgressView(value: timeAmount,total: 100) {
                Text("Loading...")
            }
            .onReceive(timer) { time in
                if timeAmount < 100 {
                    timeAmount += 20
                } else if timeAmount == 100 {
                    isLoading = true
                }
            }
        }
        .animation(.easeIn, value: timeAmount)
        .padding(.horizontal, 16)
    }
}

struct LoadingView_Previews: PreviewProvider {
    @State static var falseBool: Bool = false
    static var previews: some View {
        LoadingView(isLoading: $falseBool)
    }
}


