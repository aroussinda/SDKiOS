//
//  STDSChallengeResponseMessageExtension.swift
//  3DSExemple
//
//  Created by Sinda Arous on 04/03/2025.
//
import Foundation

@objc public protocol STDSChallengeResponseMessageExtension: NSObjectProtocol {

    /// The name of the extension data set as defined by the extension owner.
    var name: String { get }
    
    /// A unique identifier for the extension.
    var identifier: String { get }
    
    /// A Boolean value indicating whether the recipient must understand the contents of the extension to interpret the entire message.
    var isCriticalityIndicator: Bool { get }
    
    /// The data carried in the extension.
    var data: [String: Any] { get }
}

