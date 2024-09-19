//
//  LocationManager.swift
//  Meteo_IOS
//
//  Created by Anthony Baucal on 18/09/2024.
//

import Foundation
import CoreLocation


class LocationManager: NSObject, ObservableObject,CLLocationManagerDelegate{
    let manager = CLLocationManager()
    
    @Published var location : CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init(){
        super.init()
        manager.delegate = self
    }
    
    func requestLocation(){
        
        isLoading=true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("une erreur est survenu lors du chargement de la localisation",error)
        isLoading = false
 
    }
}
