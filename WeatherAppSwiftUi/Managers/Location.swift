//
//  Location.swift
//  WeatherAppSwiftUi
//
//  Created by Евгений Маглена on 24.03.2023.
//

import Foundation
import UIKit
import CoreLocation


class LocationManager: ObservableObject {
    
    var locationManager = CLLocationManager()
    let vm = WeatherViewModel()
    var coord: CLLocationCoordinate2D?
    
    
    init() {
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        if locationManager.authorizationStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else {
            startUpdatingLocation()
        }
    }
    
    public func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])-> CLLocationCoordinate2D {
        guard let coordinates = locations.last?.coordinate else {
            return CLLocationCoordinate2D(latitude: 50.450001, longitude: 30.523333)
        }
        return coordinates
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
