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
    @Published var latitude: String = ""
    @Published var longitude: String = ""
    @Published var isAuthorized: Bool = false
    @Published var location: CLLocation? = nil
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
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

    // Handle authorization status updates
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("✅ Location access granted")
        case .denied, .restricted:
            print("❌ Location access denied")
        case .notDetermined:
            print("❓ Location permission not requested yet")
        @unknown default:
            print("⚠️ Unknown authorization status")
        }
    }
}
