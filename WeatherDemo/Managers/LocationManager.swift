//
//  File.swift
//  WeatherDemo
//
//  Created by Krystian Wiewiór on 07/12/2024.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        isLoading = false
        
        if let clError = error as? CLError {
            switch clError.code {
            case .denied:
                print("Location access was denied. Please enable it in settings.")
            case .locationUnknown:
                print("The location is currently unknown.")
            case .network:
                print("Network issues are preventing location updates.")
            default:
                print("An unexpected error occurred: \(clError.localizedDescription)")
            }
        } else {
            print("An unknown error occurred: \(error.localizedDescription)")
        }
    }
}
