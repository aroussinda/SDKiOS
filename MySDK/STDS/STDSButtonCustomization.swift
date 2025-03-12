//
//  STDSButtonCustomization.swift
//  3DSExemple
//
//  Created by Sinda Arous on 04/03/2025.


import Foundation
import UIKit

/// An enum that defines the different types of buttons that are able to be customized.
enum STDSUICustomizationButtonType: Int {
    /// The submit button type.
    case submit = 0
    
    /// The continue button type.
    case continueButton = 1
    
    /// The next button type.
    case next = 2
    
    /// The cancel button type.
    case cancel = 3
    
    /// The resend button type.
    case resend = 4
}

/// An enumeration of the case transformations that can be applied to the button's title
enum STDSButtonTitleStyle: Int {
    /// Default style, doesn't modify the title
    case `default`
    
    /// Applies localizedUppercaseString to the title
    case uppercase
    
    /// Applies localizedLowercaseString to the title
    case lowercase
    
    /// Applies localizedCapitalizedString to the title
    case sentenceCapitalized
}

class STDSButtonCustomization: STDSCustomization {

    /// The default settings for the provided button type.
    static func defaultSettings(forButtonType type: STDSUICustomizationButtonType) -> STDSButtonCustomization {
        return STDSButtonCustomization(backgroundColor: type.defaultBackgroundColor, cornerRadius: 8,titleStyle: .default)
    }
    func formatTitle(_ title: String, style: STDSButtonTitleStyle) -> String {
           switch style {
           case .uppercase:
               return title.uppercased()
           case .lowercase:
               return title.lowercased()
           case .default:
               return title
           case .sentenceCapitalized:
              return  title.capitalized
           @unknown default:
               return title
           }
       }
    /**
     Initializes an instance of STDSButtonCustomization with the given backgroundColor and cornerRadius.
     */
    init(backgroundColor: UIColor, cornerRadius: CGFloat,titleStyle : STDSButtonTitleStyle) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.titleStyle = titleStyle
        super.init()
    }
    /**
     The background color of the button.
     The default for .resend and .cancel is clear.
     The default for .submit, .continue, and .next is blue.
     */
    var backgroundColor: UIColor

    /// The corner radius of the button. Defaults to 8.
    var cornerRadius: CGFloat

    /**
     The capitalization style of the button title
     */
    var titleStyle: STDSButtonTitleStyle

}

private extension STDSUICustomizationButtonType {
    var defaultBackgroundColor: UIColor {
        switch self {
        case .resend, .cancel:
            return .clear
        case .submit, .continueButton, .next:
            return .blue
        }
    }
}

