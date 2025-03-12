//
//  STDSLabelCustomization.swift
//  3DSExemple
//
//  Created by Sinda Arous on 04/03/2025.
//

import Foundation
import UIKit

/**
 A customization object to use to configure the UI of a text label.
 
 The font and textColor inherited from `STDSCustomization` configure non-heading labels.
 */
class STDSLabelCustomization: STDSCustomization {

    /// The default settings.
    static func defaultSettings() -> STDSLabelCustomization {
        return STDSLabelCustomization(headingTextColor: .black, headingFont:UIFont.systemFont(ofSize: 17))
    }

    /// The color of the heading text. Defaults to black.
    var headingTextColor: UIColor

    /// The font to use for the heading text.
    var headingFont: UIFont

    init(headingTextColor: UIColor ,headingFont: UIFont) {
        self.headingTextColor = headingTextColor
        self.headingFont = headingFont
        super.init()
    }
}
