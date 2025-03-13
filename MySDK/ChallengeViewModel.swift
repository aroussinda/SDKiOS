//
//  ChallengeViewModel.swift
//  3DSExemple
//
//  Created by Sinda Arous on 10/03/2025.
//

import Foundation

public class ChallengeResponseViewModel {
    public var selectedResponseSTDS: STDSChallengeResponse?
    
    func loadHTMLChallenge() {
        if let fileURL = Bundle.main.url(forResource: "Resources/acs_challenge", withExtension: "html") {
            let htmlContent = try? String(contentsOf: fileURL, encoding: .utf8)
            print("✅ Loaded from bundle")
        } else {
            print("❌ File not found in the Bundle")
        }

            /*let response = STDSChallengeResponse(
                threeDSServerTransactionID: "",
                acsCounterACStoSDK: "",
                acsTransactionID: "",
                acsHTML: htmlContent,
                acsUIType: .html,
                challengeCompletionIndicator: false,
                showChallengeInfoTextIndicator: false,
                challengeInfoHeader: "testHeader",
                challengeInfoLabel: "testInfoLabel",
                challengeInfoText: "testInfoText",
                challengeSelectInfo: [],
                expandInfoLabel: nil,
                expandInfoText: nil,
                issuerImage: nil,
                messageExtensions: nil,
                messageType: nil,
                messageVersion: nil,
                oobAppURL: nil,
                oobContinueLabel: nil,
                paymentSystemImage: nil,
                resendInformationLabel: nil,
                submitAuthenticationLabel: "submitAuthenticationLabel",
                whitelistingInfoText: nil,
                whyInfoLabel: "Learn more about authentication",
                whyInfoText: "This is additional information about authentication."
            )
            print("Challenge Info Header: \(response.challengeInfoHeader ?? "nil")")*/

           // return response
        
        
       // return nil
    }

    
    // MARK: - Create Challenge Response
   
    func createChallengeResponse() {
        let option1 = STDSChallengeResponseSelectionInfo(name: "Chicago, Illinois", value: "Option1")
        let option2 = STDSChallengeResponseSelectionInfo(name: "Portland, Oregon", value: "Option2")
        let option3 = STDSChallengeResponseSelectionInfo(name: "Dallas, Texas", value: "Option3")
        let option4 = STDSChallengeResponseSelectionInfo(name: "St Louis, Missouri", value: "Option4")

        selectedResponseSTDS = STDSChallengeResponse(
            threeDSServerTransactionID: "",
            acsCounterACStoSDK: "",
            acsTransactionID: "",
            acsHTML: nil,
            acsUIType: .multiSelect,
            challengeCompletionIndicator: false,
            showChallengeInfoTextIndicator: false,
            challengeInfoHeader: "Payment Security",
            challengeInfoLabel: "Question 2: What cities have you lived in?",
            challengeInfoText: "Please answer 3 security questions from YourBank to complete your payment.\n\nSelect all that apply.",
            challengeSelectInfo: [option1, option2, option3, option4],
            expandInfoLabel: nil ,
            expandInfoText: nil ,
            issuerImage: nil,
            messageExtensions: nil,
            messageType: nil,
            messageVersion: nil,
            oobAppURL: nil,
            oobContinueLabel: nil,
            paymentSystemImage: nil,
            resendInformationLabel: nil,
            submitAuthenticationLabel: "Next",
            whitelistingInfoText:nil,
            whyInfoLabel: "Learn more about authentication",
            whyInfoText: "This is additional information about authentication. You are being provided extra information you would't normally see , because you've tapped on the above label . "
        )
    }
    func createOOBChallengeResponse()  {
        let issuerImage = self.issuerImage() // Assuming this function exists
        let paymentImage = self.paymentImage() // Assuming this function exists

        selectedResponseSTDS = STDSChallengeResponse(
            threeDSServerTransactionID: "",
            acsCounterACStoSDK: "",
            acsTransactionID: "",
            acsHTML: nil,
            acsUIType: .oob,
            challengeCompletionIndicator: false,
            showChallengeInfoTextIndicator: true,
            challengeInfoHeader: "Payment Security",
            challengeInfoLabel: nil,
            challengeInfoText: """
            For added security, you will be authenticated with YourBank application.
            
            Step 1 - Open your YourBank application directly from your phone and verify this payment.
                
            Step 2 - Tap continue after you have completed authentication with your YourBank application.
            """,
           
            challengeSelectInfo: [],
            expandInfoLabel: "Need some help?",
            expandInfoText: "You've indicated that you need help! We'd be happy to assist with that, by providing helpful text here that makes sense in context.",
            issuerImage: issuerImage,
            messageExtensions: nil ,
            messageType: nil ,
            messageVersion: "",
            oobAppURL: nil,
            oobContinueLabel: "Continue",
            paymentSystemImage: paymentImage,
            resendInformationLabel: "",
            submitAuthenticationLabel: nil,
            whitelistingInfoText: nil,
             whyInfoLabel: "Learn more about authentication",
            whyInfoText: "This is additional information about authentication. You are being provided extra information you wouldn't normally see, because you've tapped on the above label."
        )
    }
    func singleSelectChallengeResponse()  {
        let infoObject1 = STDSChallengeResponseSelectionInfo(name: "***-***-*321", value: "Mobile")
        let infoObject2 = STDSChallengeResponseSelectionInfo(name: "a******3@g****.com", value: "Email")
        
        selectedResponseSTDS = STDSChallengeResponse(
            threeDSServerTransactionID: "",
            acsCounterACStoSDK: "",
            acsTransactionID: "",
            acsHTML: nil,
            acsUIType: .singleSelect,
            challengeCompletionIndicator: false,
            showChallengeInfoTextIndicator: false,

            challengeInfoHeader: "Payment Security",
            challengeInfoLabel: nil,
            challengeInfoText: "Hi Steve, your online payment is being secured using Card Network. Please select the location you would like to receive the code from YourBank.",
            challengeSelectInfo: [infoObject1, infoObject2],
            expandInfoLabel: "Need some help?",
            expandInfoText: "You've indicated that you need help! We'd be happy to assist with that, by providing helpful text here that makes sense in context.",
            issuerImage: nil,
            messageExtensions: nil,
            messageType: nil,
            messageVersion: "",
            oobAppURL: nil,
            oobContinueLabel: nil,
            paymentSystemImage: nil,
            resendInformationLabel: nil,
            submitAuthenticationLabel: "Next",
            whitelistingInfoText: nil,
            whyInfoLabel: "Learn more about authentication",
            whyInfoText: "This is additional information about authentication. You are being provided extra information you wouldn't normally see, because you've tapped on the above label."
        )
    }


    func textChallengeResponseWithWhitelist(whitelist: Bool, resendCode: Bool){
        let issuerImage = self.issuerImage()  // Assuming issuerImage is a method returning image
        let paymentImage = self.paymentImage()  // Assuming paymentImage is a method returning image

        selectedResponseSTDS =  STDSChallengeResponse(
            threeDSServerTransactionID: "",
            acsCounterACStoSDK: "",
            acsTransactionID: "",
            acsHTML: nil,
            acsUIType: .text,  // Assuming .text is an enum equivalent to STDSACSUITypeText
            challengeCompletionIndicator: false,
            showChallengeInfoTextIndicator: false,

            challengeInfoHeader: "Verify by phone",
            challengeInfoLabel: "Enter your 6 digit code:",
            challengeInfoText: "Great! We have sent you a text message with secure code to your registered mobile phone number.\n\nSent to a number ending in •••• •••• 4729.",
            challengeSelectInfo:[],
            expandInfoLabel: "Expand Info Label",
            expandInfoText: "This field displays expandable information text provided by the ACS.",
            issuerImage: issuerImage,
            messageExtensions: nil,
            messageType: nil,
            messageVersion: "",
            oobAppURL: nil,
            oobContinueLabel: nil,
            paymentSystemImage: paymentImage,
            resendInformationLabel: resendCode ? "Resend code" : nil,

            submitAuthenticationLabel: "Submit",
            whitelistingInfoText: whitelist ? "Would you like to add this Merchant to your whitelist?" : nil,
            whyInfoLabel: "Learn more about authentication",
            whyInfoText: "This is additional information about authentication. You are being provided extra information you wouldn't normally see, because you've tapped on the above label."
        )
    }

   
    func issuerImage() -> STDSChallengeResponseImage {
          let mediumDensityURL = Bundle.main.url(forResource: "150-issuer", withExtension: "png")
          let highDensityURL = Bundle.main.url(forResource: "300-issuer", withExtension: "png")
          let extraHighDensityURL = Bundle.main.url(forResource: "450-issuer", withExtension: "png")
          
          return STDSChallengeResponseImage(
              mediumDensityURL: mediumDensityURL!,
              highDensityURL: highDensityURL!,
              extraHighDensityURL: extraHighDensityURL!
          )
      }
      
      func paymentImage() -> STDSChallengeResponseImage {
          let mediumDensityURL = Bundle.main.url(forResource: "150-payment", withExtension: "png")
          let highDensityURL = Bundle.main.url(forResource: "300-payment", withExtension: "png")
          let extraHighDensityURL = Bundle.main.url(forResource: "450-payment", withExtension: "png")
          
          return STDSChallengeResponseImage(
              mediumDensityURL: mediumDensityURL!,
              highDensityURL: highDensityURL!,
              extraHighDensityURL: extraHighDensityURL!
          )
      }
}

