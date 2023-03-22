//
//  SelectLocationView.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 22.03.2023.
//

import SwiftUI
import MapKit

struct SelectLocationView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    var body: some View {
            VStack {
                MapView(centerCoordinate: $viewModel.location)
                    .ignoresSafeArea(.all)
                HStack {
                    Text("lat:\(viewModel.location.latitude)")
                    Text("lon\(viewModel.location.longitude)")

                }

            }
        

        
    }
}


struct SelectLocationView_Previews: PreviewProvider {
    static var previews: some View {
        SelectLocationView()
            .environmentObject(WeatherViewModel())
    }
}


