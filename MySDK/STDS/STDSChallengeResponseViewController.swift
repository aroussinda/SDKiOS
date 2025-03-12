//
//  STDSChallengeResponseViewController.swift
//  3DSExemple
//
//  Created by Sinda Arous on 04/03/2025.
//

import UIKit

@objc protocol STDSChallengeResponseViewControllerDelegate: AnyObject {
    
    /// Called when the user taps the Submit button after entering text in the Text flow (STDSACSUITypeText)
    func challengeResponseViewController(_ viewController: STDSChallengeResponseViewController, didSubmitInput userInput: String, whitelistSelection: STDSChallengeResponseSelectionInfo?)
    
    /// Called when the user taps the Submit button after selecting one or more options in the Single-Select (STDSACSUITypeSingleSelect) or Multi-Select (STDSACSUITypeMultiSelect) flow.
    func challengeResponseViewController(_ viewController: STDSChallengeResponseViewController, didSubmitSelection selection: [STDSChallengeResponseSelectionInfo], whitelistSelection: STDSChallengeResponseSelectionInfo?)
    
    /// Called when the user submits an HTML form.
    func challengeResponseViewController(_ viewController: STDSChallengeResponseViewController, didSubmitHTMLForm form: String)
    
    /// Called when the user taps the Continue button from an Out-of-Band flow (STDSACSUITypeOOB).
    func challengeResponseViewControllerDidOOBContinue(_ viewController: STDSChallengeResponseViewController, whitelistSelection: STDSChallengeResponseSelectionInfo?)
    
    /// Called when the user taps the Cancel button.
    func challengeResponseViewControllerDidCancel(_ viewController: STDSChallengeResponseViewController)
    
    /// Called when the user taps the Resend button.
    func challengeResponseViewControllerDidRequestResend(_ viewController: STDSChallengeResponseViewController)
}

@objc protocol STDSChallengeResponseViewControllerPresentationDelegate: AnyObject {
    func dismissChallengeResponseViewController(_ viewController: STDSChallengeResponseViewController)
}

class STDSChallengeResponseViewController: UIViewController {

    weak var delegate: STDSChallengeResponseViewControllerDelegate?
    weak var presentationDelegate: STDSChallengeResponseViewControllerPresentationDelegate?

    private(set) var response: STDSChallengeResponse?

    init(uiCustomization: STDSUICustomization?, imageLoader: STDSImageLoader, directoryServer: STDSDirectoryServer, analyticsDelegate: STDSAnalyticsDelegate?) {
        // Initialize the view controller
        super.init(nibName: nil, bundle: nil)
        // Custom initialization if needed
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setChallengeResponse(_ response: STDSChallengeResponse, animated: Bool) {
        // Update the challenge response
    }
    
    func setLoading() {
        // Show loading spinner
    }

    func dismiss() {
        // Dismiss the view controller
    }
}
