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
    internal func showSDKSheetHTML(from viewController: UIViewController) {
        let bundle = Bundle(for: MySDKManager.self) // No optional binding needed

        if
            
           let url = bundle.url(forResource: "acs_challenge", withExtension: "html") {
            print("✅ HTML File Found at: \(url)")
            let fileName = "acs_challenge"
            let fileType = "html"
            selectedResponseSTDS = viewModel.createChallengeResponse()
            let sheetView = UIHostingController(rootView: SheetViewHTML( fileName: fileName, fileType: fileType, onClose: {
                viewController.dismiss(animated: true, completion: nil)
            }))
            sheetView.modalPresentationStyle = .pageSheet
            viewController.present(sheetView, animated: true, completion: nil)
        } else {
            print("❌ HTML File Not Found")
        }

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
    public func showSDKSheetTextWR(from viewController: UIViewController) {
        selectedResponseSTDS = viewModel.textChallengeResponseWithWhitelist(whitelist:true, resendCode: true)
        let sheetView = UIHostingController(rootView: SheetViewChallenge(response: selectedResponseSTDS!, onClose: {
            viewController.dismiss(animated: true, completion: nil)
        }))
        sheetView.modalPresentationStyle = .pageSheet
        viewController.present(sheetView, animated: true, completion: nil)
       
       }
    public func showSDKSheetTextR(from viewController: UIViewController) {
        selectedResponseSTDS = viewModel.textChallengeResponseWithWhitelist(whitelist:false, resendCode: true)
        let sheetView = UIHostingController(rootView: SheetViewChallenge(response: selectedResponseSTDS!, onClose: {
            viewController.dismiss(animated: true, completion: nil)
        }))
        sheetView.modalPresentationStyle = .pageSheet
        viewController.present(sheetView, animated: true, completion: nil)
       
       }
    
    public func showSDKSheetTextW(from viewController: UIViewController) {
        selectedResponseSTDS = viewModel.textChallengeResponseWithWhitelist(whitelist:true, resendCode: false)
        let sheetView = UIHostingController(rootView: SheetViewChallenge(response: selectedResponseSTDS!, onClose: {
            viewController.dismiss(animated: true, completion: nil)
        }))
        sheetView.modalPresentationStyle = .pageSheet
        viewController.present(sheetView, animated: true, completion: nil)
       
       }
    public func showSDKSheetText(from viewController: UIViewController) {
        selectedResponseSTDS = viewModel.textChallengeResponseWithWhitelist(whitelist:false, resendCode: false)
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
