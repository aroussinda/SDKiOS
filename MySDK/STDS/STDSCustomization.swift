//
//  STDSCustomization.swift
//  3DSExemple
//
//  Created by Sinda Arous on 04/03/2025.
//



import Foundation
import UIKit

/// This class provides a common set of customization parameters, used to customize elements of the UI.
class STDSCustomization: NSObject, NSCopying {

    /// The font to use for text.
    var font: UIFont?

    /// The color to use for the text.
    var textColor: UIColor?

    // MARK: - NSCopying

    func copy(with zone: NSZone? = nil) -> Any {
        let copy = STDSCustomization()
        copy.font = self.font
        copy.textColor = self.textColor
        return copy
    }
}
