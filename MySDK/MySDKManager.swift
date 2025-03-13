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
    public func showSDKSheetMultiSelect(from viewController: UIViewController) {

        selectedResponseSTDS = viewModel.createChallengeResponse()
        let sheetView = UIHostingController(rootView: SheetViewChallenge(response: selectedResponseSTDS!, onClose: {
            viewController.dismiss(animated: true, completion: nil)
        }))
        sheetView.modalPresentationStyle = .pageSheet
        viewController.present(sheetView, animated: true, completion: nil)
       
       }
    public func showSDKSheetOOB(from viewController: UIViewController) {
        selectedResponseSTDS = viewModel.createOOBChallengeResponse()
        let sheetView = UIHostingController(rootView: SheetViewChallenge(response: selectedResponseSTDS!, onClose: {
            viewController.dismiss(animated: true, completion: nil)
        }))
        sheetView.modalPresentationStyle = .pageSheet
        viewController.present(sheetView, animated: true, completion: nil)
       
       }
    public func showSDKSheetSignleSelect(from viewController: UIViewController) {
        selectedResponseSTDS = viewModel.singleSelectChallengeResponse()
        let sheetView = UIHostingController(rootView: SheetViewChallenge(response: selectedResponseSTDS!, onClose: {
            viewController.dismiss(animated: true, completion: nil)
        }))
        sheetView.modalPresentationStyle = .pageSheet
        viewController.present(sheetView, animated: true, completion: nil)
       
       }
    
    public func fetchLocation() -> CLLocation? {
           return MySDKLocationManager.shared.getLocation()
       }
}
