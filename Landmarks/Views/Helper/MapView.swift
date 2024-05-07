//
//  MapView.swift
//  Landmarks
//
//  Created by Админ on 01.04.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var body: some View {
       Map(coordinateRegion: $region)
    }

    
    @State private var region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
