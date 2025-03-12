//
//  STDSFooterCustomization.swift
//  3DSExemple
//
//  Created by Sinda Arous on 04/03/2025.
//


import Foundation
import UIKit

/**
 The Challenge view displays a footer with additional details that
 expand when tapped. This object configures the appearance of that view.
 */
class STDSFooterCustomization: STDSCustomization {

    /// The default settings.
    static func defaultSettings() -> STDSFooterCustomization {
        return STDSFooterCustomization(backgroundColor: .clear, chevronColor: .darkGray, headingTextColor: .black, headingFont: UIFont.systemFont(ofSize: 17))
    }

    /**
     The background color of the footer.
     Defaults to gray.
     */
    var backgroundColor: UIColor

    /**
     The color of the chevron. Defaults to a dark gray.
     */
    var chevronColor: UIColor

    /**
     The color of the heading text. Defaults to black.
     */
    var headingTextColor: UIColor

    /// The font to use for the heading text.
    var headingFont: UIFont

     init(backgroundColor: UIColor, chevronColor: UIColor,headingTextColor: UIColor,headingFont: UIFont) {
        self.backgroundColor = backgroundColor
        self.chevronColor = chevronColor
        self.headingTextColor = headingTextColor
        self.headingFont = headingFont
        super.init()
    }
}
