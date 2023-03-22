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
        MapView(centerCoordinate: $viewModel.location)
    }
}


struct SelectLocationView_Previews: PreviewProvider {
    static var previews: some View {
        SelectLocationView()
            .environmentObject(WeatherViewModel())
    }
}


