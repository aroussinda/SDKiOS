//
//  MySDKManager.swift
//  MySDK
//
//  Created by Sinda Arous on 25/02/2025.
//

import Foundation
import UIKit
import SwiftUI

public class MySDKManager {
    
    public init() {}
    
    @MainActor
    public func showSDKSheet(from viewController: UIViewController, message: String) {
           let sheetView = UIHostingController(rootView: SheetView(message: message, onClose: {
               viewController.dismiss(animated: true, completion: nil)
           }))
           sheetView.modalPresentationStyle = .pageSheet
           viewController.present(sheetView, animated: true, completion: nil)
       }
    
}
