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
    @EnvironmentObject var location: LocationManager
    var body: some View {
            VStack {
                MapView(centerCoordinate: $viewModel.mapDefaultCoordinate)
                
                    .ignoresSafeArea(.all)
                HStack {
                    Text("lat:\(viewModel.mapDefaultCoordinate.latitude)")
                    Text("lon\(viewModel.mapDefaultCoordinate.longitude)")
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


