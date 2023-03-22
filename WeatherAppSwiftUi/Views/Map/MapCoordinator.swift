//
//  MapCoordinator.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 22.03.2023.
//

import Foundation
import MapKit

class Coordinator: NSObject, MKMapViewDelegate, UIGestureRecognizerDelegate {
    var parent: MapView
    
    var gRecognizer = UITapGestureRecognizer()

    init(_ parent: MapView) {
        self.parent = parent
        super.init()
        self.gRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        self.gRecognizer.delegate = self
        self.parent.mapView.addGestureRecognizer(gRecognizer)
    }

    @objc func tapHandler(_ gesture: UITapGestureRecognizer) {
        let location = gRecognizer.location(in: self.parent.mapView)
        let coordinate = self.parent.mapView.convert(location, toCoordinateFrom: self.parent.mapView)
        print(coordinate)
        parent.centerCoordinate = coordinate
        
    }
}

