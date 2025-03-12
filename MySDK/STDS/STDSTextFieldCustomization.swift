//
//  STDSTextFieldCustomization.swift
//  3DSExemple
//
//  Created by Sinda Arous on 04/03/2025.
//

import Foundation
import UIKit

/**
 A customization object to use to configure the UI of a text field.

 The font and textColor inherited from `STDSCustomization` configure
 the user input text.
 */
class STDSTextFieldCustomization: STDSCustomization {

    /**
     The default settings.
     
     The default textColor is black.
     */
    static func defaultSettings() -> STDSTextFieldCustomization {
        return STDSTextFieldCustomization()
    }

    /// The border width of the text field. Defaults to 2.
    var borderWidth: CGFloat

    /// The color of the border of the text field. Defaults to clear.
    var borderColor: UIColor

    /// The corner radius of the edges of the text field. Defaults to 8.
    var cornerRadius: CGFloat

    /// The appearance of the keyboard. Defaults to UIKeyboardAppearanceDefault.
    var keyboardAppearance: UIKeyboardAppearance

    /// The color of the placeholder text. Defaults to light gray.
    var placeholderTextColor: UIColor

    override init() {
        self.borderWidth = 2
        self.borderColor = .clear
        self.cornerRadius = 8
        self.keyboardAppearance = .default
        self.placeholderTextColor = .lightGray
        super.init()
    }
}
