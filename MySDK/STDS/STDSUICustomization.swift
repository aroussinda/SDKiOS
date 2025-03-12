//
//  STDSUICustomization.swift
//  3DSExemple
//
//  Created by Sinda Arous on 04/03/2025.
//


import Foundation
import UIKit

/**
 The `STDSUICustomization` provides configuration for UI elements.
 
 It's important to configure this object appropriately before using it to initialize a
 `STDSThreeDS2Service` object. `STDSThreeDS2Service` makes a copy of the customization
 settings you provide; it ignores any subsequent changes you make to your `STDSUICustomization` instance.
 */
class STDSUICustomization: NSObject, NSCopying {

    /// The default settings. See individual properties for their default values.
    static func defaultSettings() -> STDSUICustomization {
        return STDSUICustomization()
    }

    /**
     Provides custom settings for the UINavigationBar of all UIViewControllers the SDK displays.
     The default is `[STDSNavigationBarCustomization defaultSettings]`.
     */
    var navigationBarCustomization: STDSNavigationBarCustomization

    /**
     Provides custom settings for labels.
     The default is `[STDSLabelCustomization defaultSettings]`.
     */
    var labelCustomization: STDSLabelCustomization

    /**
     Provides custom settings for text fields.
     The default is `[STDSTextFieldCustomization defaultSettings]`.
     */
    var textFieldCustomization: STDSTextFieldCustomization

    /**
     The primary background color of all UIViewControllers the SDK displays.
     Defaults to white.
     */
    var backgroundColor: UIColor

    /**
     The Challenge view displays a footer with additional details. This controls the background color of that view.
     Defaults to gray.
     */
    var footerCustomization: STDSFooterCustomization
    var buttonCustomizationDictionary: [Int: STDSButtonCustomization] = [:]
    /**
     Sets a given button customization for the specified type.
     
     - Parameters:
        - buttonCustomization: The button customization to use.
        - buttonType: The type of button to use the customization for.
     */
    func setButtonCustomization(_ buttonCustomization: STDSButtonCustomization, forType buttonType: STDSUICustomizationButtonType)
    {
        buttonCustomizationDictionary[buttonType.rawValue] = buttonCustomization
    }

    /**
     Retrieves a button customization object for the given button type.
     
     - Parameter buttonType: The button type to retrieve a customization object for.
     - Returns: A button customization object, or the default if none was set.
     */
    func buttonCustomizationForButtonType(_ buttonType: STDSUICustomizationButtonType) -> STDSButtonCustomization?
    {
        return buttonCustomizationDictionary[buttonType.rawValue]
    }

    /**
     Provides custom settings for radio buttons and checkboxes.
     The default is `[STDSSelectionCustomization defaultSettings]`.
     */
    var selectionCustomization: STDSSelectionCustomization

    /**
     The preferred status bar style for all UIViewControllers the SDK displays.
     Defaults to UIStatusBarStyleDefault.
     */
    var preferredStatusBarStyle: UIStatusBarStyle

    // MARK: - Progress View

    /**
     The style of UIActivityIndicatorViews displayed.
     This should contrast with `backgroundColor`. Defaults to regular on iOS 13+, gray on iOS 10-12.
     */
    var activityIndicatorViewStyle: UIActivityIndicatorView.Style

    /**
     The style of the UIBlurEffect displayed underneath the UIActivityIndicatorView.
     Defaults to UIBlurEffectStyleDefault.
     */
    var blurStyle: UIBlurEffect.Style

    override init() {
        self.navigationBarCustomization = STDSNavigationBarCustomization.defaultSettings()
        self.labelCustomization = STDSLabelCustomization.defaultSettings()
        self.textFieldCustomization = STDSTextFieldCustomization.defaultSettings()
        self.backgroundColor = .white
        self.footerCustomization = STDSFooterCustomization.defaultSettings()
        self.selectionCustomization = STDSSelectionCustomization.defaultSettings()
        self.preferredStatusBarStyle = .default
        self.activityIndicatorViewStyle = .medium
        self.blurStyle = .extraLight
        super.init()
    }

    // MARK: - NSCopying

    func copy(with zone: NSZone? = nil) -> Any {
        let copy = STDSUICustomization()
        copy.navigationBarCustomization = self.navigationBarCustomization
        copy.labelCustomization = self.labelCustomization
        copy.textFieldCustomization = self.textFieldCustomization
        copy.backgroundColor = self.backgroundColor
        copy.footerCustomization = self.footerCustomization
        copy.selectionCustomization = self.selectionCustomization
        copy.preferredStatusBarStyle = self.preferredStatusBarStyle
        copy.activityIndicatorViewStyle = self.activityIndicatorViewStyle
        copy.blurStyle = self.blurStyle
        return copy
    }
}
