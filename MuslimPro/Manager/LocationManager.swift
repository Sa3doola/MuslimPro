//
//  LocationManager.swift
//  MuslimPro
//
//  Created by Saad Sherif on 7/28/21.
//

import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    // MARK: - Properties
    
    static let shared = LocationManager()
    
    var locationManager: CLLocationManager!
    var location: CLLocation?
    
 //   var completion: ((CLLocation) -> Void)?
    
    // MARK: - init
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        startMySignificantLocationChanges()
    }
    
    // MARK: - Helper Functions
    
    /**
     Use Significant Location Change Service
     */
    
    func startMySignificantLocationChanges() {
        if !CLLocationManager.significantLocationChangeMonitoringAvailable() {
            // The device does not support this service.
            return
        }
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    /**
     Get User Location function with completion
     */
    
    public func requestLocationServices() {
        locationManager.requestAlwaysAuthorization()
        startMySignificantLocationChanges()
    }
 
    // MARK: - CLLocationManager Delegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        self.location = location
        locationManager.stopMonitoringSignificantLocationChanges()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let error = error as? CLError, error.code == .denied {
            // Location updates are not authorized.
            locationManager.stopMonitoringSignificantLocationChanges()
            print(error.localizedDescription)
            return
        }
    }
}
