//
//  STDSNavigationBarCustomazation.swift
//  3DSExemple
//
//  Created by Sinda Arous on 04/03/2025.
//

import Foundation
import UIKit

/**
 A customization object to use to configure a UINavigationBar.
 
 The font and textColor inherited from `STDSCustomization` configure the
 title of the navigation bar, and default to nil.
 */
class STDSNavigationBarCustomization: STDSCustomization {

    /// The default settings.
    static func defaultSettings() -> STDSNavigationBarCustomization {
        return STDSNavigationBarCustomization(scrollEdgeAppearance: nil,textColorButton:.gray, barTintColor: nil, barStyle: .default, translucent: true, headerText: "Authentification", buttonText: "Close")
    }

    /**
     The scroll edge appearance to set on the navigation bar.
     
     Defaults to `nil`.
     */
    var scrollEdgeAppearance: UINavigationBarAppearance?

    /**
     The tint color of the navigation bar background.
     Defaults to nil.
     */
    var barTintColor: UIColor?
    var textColorButton: UIColor

    /**
     The navigation bar style.
     Defaults to UIBarStyleDefault.
     */
    var barStyle: UIBarStyle

    /**
     A Boolean value indicating whether the navigation bar is translucent or not.
     Defaults to true.
     */
    var translucent: Bool

    /**
     The text to display in the title of the navigation bar.
     Defaults to "Secure checkout".
     */
    var headerText: String

    /**
     The text to display for the button in the navigation bar.
     Defaults to "Cancel".
     */
    var buttonText: String

    init(scrollEdgeAppearance: UINavigationBarAppearance?,textColorButton:UIColor,barTintColor: UIColor?,barStyle: UIBarStyle,translucent: Bool,headerText: String,buttonText: String) {
        self.scrollEdgeAppearance = scrollEdgeAppearance
        self.textColorButton = textColorButton
        self.barTintColor = barTintColor
        self.barStyle = barStyle
        self.translucent = translucent
        self.headerText = headerText
        self.buttonText = buttonText
        super.init()
    }
}
