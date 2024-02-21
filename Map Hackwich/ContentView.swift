//
//  ContentView.swift
//  Map Hackwich
//
//  Created by Umesh Sarma on 2/21/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var startPosition = MapCameraPosition.region(

            MKCoordinateRegion(center: CLLocationCoordinate2D(

                latitude: 42.15559,

                longitude: -88.14692),

            span: MKCoordinateSpan(

                latitudeDelta: 0.05,

                longitudeDelta: 0.05)

            )
        )
    var body: some View {
        VStack {
            Map(position: $startPosition)
        }
        
    }
}

#Preview {
    ContentView()
}
