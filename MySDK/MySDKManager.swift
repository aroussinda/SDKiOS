//
//  MySDKManager.swift
//  MySDK
//
//  Created by Sinda Arous on 25/02/2025.
//

import Foundation
import UIKit
import SwiftUI
import CoreLocation

public class MySDKManager {
    public var viewModel = ChallengeResponseViewModel()
    public var selectedResponseSTDS: STDSChallengeResponse?

    public init() {}
    

    
    public func showSDKSheet(from viewController: UIViewController, message: String) {
           let sheetView = UIHostingController(rootView: SheetView(message: message, onClose: {
               viewController.dismiss(animated: true, completion: nil)
           }))
           sheetView.modalPresentationStyle = .pageSheet
           viewController.present(sheetView, animated: true, completion: nil)
       }
    public func showSDKSheetHTML(from viewController: UIViewController) {
        print("click")
        selectedResponseSTDS = viewModel.loadHTMLChallenge()
       
        print("loaded")
        print(selectedResponseSTDS!.challengeInfoHeader!)
        print("nul")
        let sheetView = UIHostingController(rootView: SheetViewHTML(response: viewModel.selectedResponseSTDS!, onClose: {
            viewController.dismiss(animated: true, completion: nil)
        }))
        sheetView.modalPresentationStyle = .pageSheet
        viewController.present(sheetView, animated: true, completion: nil)
       
       }
    
    
    public func fetchLocation() -> CLLocation? {
           return MySDKLocationManager.shared.getLocation()
       }
}
