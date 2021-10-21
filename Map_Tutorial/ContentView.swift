//
//  ContentView.swift
//  Map_Tutorial
//
//  Created by 전준표 on 2021/10/21.
//

import SwiftUI
import MapKit

struct ContentView: View {

    //서울시청 좌표
    @State var userLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.56646086887688, longitude: 126.97796141986984), span: MKCoordinateSpan())
        
    var body: some View {
//        Map(coordinateRegion: $userLocation)
//            .edgesIgnoringSafeArea(.all)
        myMapView()
            .edgesIgnoringSafeArea(.all)
           

        
        
        
        
        
        
    } // body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
