//
//  myMapView.swift
//  Map_Tutorial
//
//  Created by 전준표 on 2021/10/21.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

struct myMapView: UIViewRepresentable {
    
    let locationManager = CLLocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mkMapView = MKMapView()
        
        // 맵뷰 델리게이트 연결
        mkMapView.delegate = context.coordinator
        
        // 위치 매니저 델리게이트 연결
        self.locationManager.delegate = context.coordinator
        
        // 위치 정확도 설정
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // 위치 이용 허용 물어보기
        self.locationManager.requestWhenInUseAuthorization()
        
        // 현재 위치 업데이트 시작
        self.locationManager.startUpdatingLocation()
        
        mkMapView.showsUserLocation = true // 현재 사용자 위치 보여주기
        mkMapView.setUserTrackingMode(.follow, animated: true) // 따라오는지 여부
        
        let regionRadius : CLLocationDistance = 200 // 맵 카메라 반경
        
        // 보여줄 지역 설정
        let coordintionRegion = MKCoordinateRegion(center: mkMapView.userLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        // 지도의 지역 설정
        mkMapView.setRegion(coordintionRegion, animated: true)
        
        return mkMapView
        
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    func makeCoordinator() -> myMapView.Coordinator {
        return myMapView.Coordinator(self)
    }
    
    class Coordinator: NSObject {
        
        var MyMapView: myMapView
        
        init(_ MyMapView: myMapView){
            self.MyMapView = MyMapView
        }
        
    }
    
    
    
    
} // end

extension myMapView.Coordinator: MKMapViewDelegate {
    
}

extension myMapView.Coordinator: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lat = locations.first?.coordinate.latitude,
              let long = locations.first?.coordinate.longitude else {
            return
        }
        print(Text("위도 : \(lat), 경도 : \(long)"))
        
        
                
    }
    
}
