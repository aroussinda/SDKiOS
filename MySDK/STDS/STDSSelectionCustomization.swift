//
//  STDSSelectionCustomization.swift
//  3DSExemple
//
//  Created by Sinda Arous on 04/03/2025.
//

import UIKit

class STDSSelectionCustomization: NSObject  {
    
    /// The default settings.
    class func defaultSettings() -> STDSSelectionCustomization {
        return STDSSelectionCustomization(primarySelectedColor: .systemBlue, secondarySelectedColor: .white, unselectedBackgroundColor: .lightGray, unselectedBorderColor: .blue)
    }
    
    /// The primary color of the selected state. Defaults to blue.
    var primarySelectedColor: UIColor
    
    /// The secondary color of the selected state (e.g. the checkmark color). Defaults to white.
    var secondarySelectedColor: UIColor
    
    /// The background color displayed in the unselected state. Defaults to light blue.
    var unselectedBackgroundColor: UIColor
    
    /// The color of the border drawn around the view in the unselected state. Defaults to blue.
    var unselectedBorderColor: UIColor
    
    init(primarySelectedColor: UIColor , secondarySelectedColor: UIColor ,unselectedBackgroundColor: UIColor,unselectedBorderColor: UIColor) {
        self.primarySelectedColor = primarySelectedColor
        self.secondarySelectedColor = secondarySelectedColor
        self.unselectedBackgroundColor = unselectedBackgroundColor
        self.unselectedBorderColor = unselectedBorderColor
        super.init()
    }
    
    
}
