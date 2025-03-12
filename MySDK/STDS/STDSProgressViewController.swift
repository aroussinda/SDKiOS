//
//  STDSProgressViewController.swift
//  3DSExemple
//
//  Created by Sinda Arous on 07/03/2025.
//

import UIKit

class STDSProgressViewController: UIViewController {
    
    private let directoryServer: STDSDirectoryServer
    private let uiCustomization: STDSUICustomization?
    private let analyticsDelegate: STDSAnalyticsDelegate?
    private let didCancel: (() -> Void)?

    // Custom initializer
    init(directoryServer: STDSDirectoryServer,
         uiCustomization: STDSUICustomization? = nil,
         analyticsDelegate: STDSAnalyticsDelegate? = nil,
         didCancel: (() -> Void)? = nil) {
        
        self.directoryServer = directoryServer
        self.uiCustomization = uiCustomization
        self.analyticsDelegate = analyticsDelegate
        self.didCancel = didCancel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
