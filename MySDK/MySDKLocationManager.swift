//
//  MySDKLocationManager.swift
//  MySDK
//
//  Created by Sinda Arous on 12/03/2025.
//

import Foundation
import CoreLocation

public class MySDKLocationManager: NSObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    public var location: CLLocation? = nil
    public var authorizationStatus: CLAuthorizationStatus = .notDetermined

    public static let shared = MySDKLocationManager()

    
    public override init() {
    
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // This works correctly now
        locationManager.startUpdatingLocation()  // Start updating the location
    }
    
    // Request location permission
    public func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization() // or requestAlwaysAuthorization()
    }
    // Delegate method to update location
   public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let newLocation = locations.last {
            location = newLocation
          
        }
    }
    // Handle authorization status updates
    public func checkLocationPermission() {
           let status = CLLocationManager.authorizationStatus()
           
           if status == .notDetermined {
               // Demande l'autorisation à l'utilisateur
               locationManager.requestWhenInUseAuthorization()
           } else if status == .denied || status == .restricted {
               print("⚠️ L'utilisateur a refusé la localisation.")
              
           } else {
               // Démarrer la mise à jour de la localisation
               locationManager.startUpdatingLocation()
           }
       }

}
