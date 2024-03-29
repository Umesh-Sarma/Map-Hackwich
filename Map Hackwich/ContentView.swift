//
//  ContentView.swift
//  Map Hackwich
//
//  Created by Umesh Sarma on 2/21/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 42.15704,
            longitude: -88.14812),
        span: MKCoordinateSpan(
            latitudeDelta: 0.05,
            longitudeDelta: 0.05)
    )
    @StateObject var locationManager = LocationManager()
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    
    @State private var places = [Place(name: "Barrington High School",

                        coordinate: CLLocationCoordinate2D(

                            latitude: 42.15704, longitude: -88.14812))]
    
    
    func findLocation(name: String) {

            locationManager.geocoder.geocodeAddressString(name) { (placemarks, error) in

                guard placemarks != nil else {

                    print("Could not locate \(name)")

                    return

                }

                for placemark in placemarks! {

                    let place = Place(name: "\(placemark.name!), \(placemark.administrativeArea!)",

                                      coordinate: placemark.location!.coordinate)

                    places.append(place)

                }

            }

        }


    var body: some View {
        VStack {
            Map(coordinateRegion: $region,

                        interactionModes: .all,

                        showsUserLocation: true,

                        userTrackingMode: $userTrackingMode,

                        annotationItems: places) { place in

                        MapAnnotation(coordinate: place.coordinate,

                                      anchorPoint: CGPoint(x: 0.5, y: 1.2)) {

                            Marker(name: place.name)

                        }

                    }
            
                        .onAppear {

                                    findLocation(name: "Springfield")

                                }
        }
    }
}

struct Place: Identifiable {

    let id = UUID()

    let name: String

    let coordinate: CLLocationCoordinate2D

}

struct Marker: View {

    var name: String

    var body: some View {

        ZStack {

            VStack {

                Spacer(minLength: 15)

                Rectangle()

                    .fill(Color.black)

                    .frame(width: 30, height: 30, alignment: .center)

                    .rotationEffect(.degrees(45))

            }

            Capsule()

                .fill(Color.red)

                .frame(width: 200, height: 30, alignment: .center)

            Text(name)

        }

    }

}

#Preview {
    ContentView()
}
