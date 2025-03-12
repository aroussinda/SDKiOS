//
//  STDSDemoViewContoller.swift
//  3DSExemple
//
//  Created by Sinda Arous on 04/03/2025.
//

import UIKit



class STDSDemoViewController: UIViewController, STDSChallengeResponseViewControllerDelegate {
    func challengeResponseViewController(_ viewController: STDSChallengeResponseViewController, didSubmitInput userInput: String, whitelistSelection: ( STDSChallengeResponseSelectionInfo)?) {
        
    }
    
    func challengeResponseViewController(_ viewController: STDSChallengeResponseViewController, didSubmitSelection selection: [ STDSChallengeResponseSelectionInfo], whitelistSelection: ( STDSChallengeResponseSelectionInfo)?) {
        
    }
    
    func challengeResponseViewController(_ viewController: STDSChallengeResponseViewController, didSubmitHTMLForm form: String) {
        
    }
    
    func challengeResponseViewControllerDidOOBContinue(_ viewController: STDSChallengeResponseViewController, whitelistSelection: ( STDSChallengeResponseSelectionInfo)?) {
        
    }
    
    func challengeResponseViewControllerDidCancel(_ viewController: STDSChallengeResponseViewController) {
        
    }
    
    func challengeResponseViewControllerDidRequestResend(_ viewController: STDSChallengeResponseViewController) {
        
    }
    
    

    var shouldLoadSlowly: Bool
    var isDarkMode: Bool
    
    
    var imageLoader: STDSImageLoader
    var customization: STDSUICustomization

    init() {
        self.imageLoader = STDSImageLoader.init()
        self.customization = STDSUICustomization.defaultSettings()
        self.shouldLoadSlowly = false
        self.isDarkMode = false
        super.init(nibName: nil, bundle: nil)

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        self.customization.navigationBarCustomization.scrollEdgeAppearance = appearance
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


   
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set the background color
            self.view.backgroundColor = UIColor.systemBackground // Assuming _stds_systemBackgroundColor is a custom extension
            
            // Create and set up the container view (assumed to be a custom stack view class)
            let containerView = STDSStackView(alignment: .vertical)
            self.view.addSubview(containerView)
            containerView._stds_pinToSuperviewBound() // Assuming _stds_pinToSuperviewBounds is a custom method
            
            // Mapping of button titles to selector methods
            let buttonTitleToSelectorMapping: [String: Selector] = [
                "Toggle Dark Mode": #selector(toggleDarkMode),
                "Present Text Challenge": #selector(presentTextChallenge),
                "Present Text Challenge With Whitelist": #selector(presentTextChallengeWithWhitelist),
                "Present Text Challenge With Resend": #selector(presentTextChallengeWithResendCode),
                "Present Text Challenge With Whitelist and Resend": #selector(presentTextChallengeWithResendCodeAndWhitelist),
                "Present Text Challenge (loads slowly w/ initial progressView)": #selector(presentTextChallengeLoadsSlowly),
                "Present Single Select Challenge": #selector(presentSingleSelectChallenge),
                "Present Multi Select Challenge": #selector(presentMultiSelectChallenge),
                "Present OOB Challenge": #selector(presentOOBChallenge),
                "Present HTML Challenge": #selector(presentHTMLChallenge),
                "Present Progress View": #selector(presentProgressView)
            ]
            
            // Sorting and creating buttons
            for key in buttonTitleToSelectorMapping.keys.sorted() {
                let button = UIButton(type: .system)
                if let selector = buttonTitleToSelectorMapping[key] {
                    button.addTarget(self, action: selector, for: .touchUpInside)
                }
                button.titleLabel?.numberOfLines = 0
                button.titleLabel?.textAlignment = .center
                button.setTitle(key, for: .normal)
                containerView.addArrangedSubview(button)
            }
            
            // Add an empty view as an extra arranged subview
            containerView.addArrangedSubview(UIView())
        }
        
        // Define your selectors here
        @objc func toggleDarkMode() {
            if isDarkMode {
                  customization = STDSUICustomization.defaultSettings()
                  isDarkMode = false
              } else {
                  customization = STDSUICustomization.defaultSettings()
                  
                  // Navigation bar
                 /* let navigationBarCustomization = STDSNavigationBarCustomization()
                  navigationBarCustomization.headerText = "Authentication"
                  navigationBarCustomization.buttonText = "Nope"
                  navigationBarCustomization.textColor = UIColor.white
                  navigationBarCustomization.barStyle = .black
                  customization.navigationBarCustomization = navigationBarCustomization
                  */
                  // General
                  customization.backgroundColor = UIColor.black
                  customization.activityIndicatorViewStyle = .medium
                  customization.preferredStatusBarStyle = .lightContent
                      /*let footerCustomization = STDSFooterCustomization()
                  footerCustomization.backgroundColor = UIColor(red: 0.08, green: 0.08, blue: 0.08, alpha: 1)
                  footerCustomization.headingFont = UIFont.boldSystemFont(ofSize: 15)
                  footerCustomization.headingTextColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
                  footerCustomization.textColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1)
                  customization.footerCustomization = footerCustomization*/
                  
                  // Cancel button
                  let cancelButtonCustomization = STDSButtonCustomization.defaultSettings(forButtonType: .cancel)
                  cancelButtonCustomization.textColor = UIColor.gray
                  cancelButtonCustomization.titleStyle = .uppercase
                  customization.setButtonCustomization(cancelButtonCustomization, forType: .cancel)
                  
                  // Text
                  customization.labelCustomization.headingTextColor = UIColor.white
                  customization.labelCustomization.textColor = UIColor.white
                  
                  // Text field
                  customization.textFieldCustomization.keyboardAppearance = .dark
                  customization.textFieldCustomization.textColor = UIColor.white
                  customization.textFieldCustomization.borderColor = UIColor.white
                  
                  // Radio/Checkbox
                  customization.selectionCustomization.secondarySelectedColor = UIColor.lightGray
                  customization.selectionCustomization.unselectedBorderColor = UIColor.black
                  customization.selectionCustomization.unselectedBackgroundColor = UIColor.darkGray
                  
                  isDarkMode = true
              }
        }
        
        @objc func presentTextChallenge() {
            //presentChallenge(forChallengeResponse: STDSChallengeResponseObject.textChallengeResponse(withWhitelist: false, resendCode: false))
        }

    @objc func presentTextChallengeWithWhitelist() {
            //presentChallenge(forChallengeResponse: STDSChallengeResponseObject.textChallengeResponse(withWhitelist: true, resendCode: false))
        }

    @objc func presentTextChallengeWithResendCode() {
           // presentChallenge(forChallengeResponse: STDSChallengeResponseObject.textChallengeResponse(withWhitelist: false, resendCode: true))
        }

    @objc func presentTextChallengeWithResendCodeAndWhitelist() {
           // presentChallenge(forChallengeResponse: STDSChallengeResponseObject.textChallengeResponse(withWhitelist: true, resendCode: true))
        }

        
        @objc func presentTextChallengeLoadsSlowly() {
            // Implement the functionality
        }
        
        @objc func presentSingleSelectChallenge() {
            // Implement the functionality
        }
        
        @objc func presentMultiSelectChallenge() {
            // Implement the functionality
        }
        
        @objc func presentOOBChallenge() {
            // Implement the functionality
        }
        
        @objc func presentHTMLChallenge() {
            // Implement the functionality
        }
        
        @objc func presentProgressView() {
            // Implement the functionality
        }
    
    func presentChallenge(forChallengeResponse challengeResponse: STDSChallengeResponse) {
        let challengeResponseViewController = STDSChallengeResponseViewController(
            uiCustomization: self.customization,
            imageLoader: self.imageLoader,
            directoryServer: .ulTestEC,
            analyticsDelegate: nil
        )
        
        challengeResponseViewController.delegate = self
        
        let navigationController = UINavigationController(rootViewController: challengeResponseViewController)
        self.navigationController?.present(navigationController, animated: true, completion: nil)
        
        // Simulate what `STDSTransaction` does
        challengeResponseViewController.setLoading()
        let delay = shouldLoadSlowly ? 5 : 0
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            challengeResponseViewController.setChallengeResponse(challengeResponse, animated: true)
        }
    }

    
}
