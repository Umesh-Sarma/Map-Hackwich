//
//  LocationManager.swift
//  Map Hackwich
//
//  Created by Umesh Sarma on 2/22/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    var locationManager = CLLocationManager()
    var geocoder = CLGeocoder()

    
    override init() {

            super.init()

            locationManager.delegate = self

            locationManager.requestWhenInUseAuthorization()

            locationManager.startUpdatingLocation()

        }
}
