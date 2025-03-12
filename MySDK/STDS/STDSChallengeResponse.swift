//
//  STDSChallengeResponse.swift
//  3DSExemple
//
//  Created by Sinda Arous on 04/03/2025.
//

import Foundation
enum STDSACSUIType: Int {
    case none = 0
    case text = 1
    case singleSelect = 2
    case multiSelect = 3
    case oob = 4
    case html = 5
}

public class STDSChallengeResponse : Identifiable {

    var threeDSServerTransactionID: String
    var acsCounterACStoSDK: String
    var acsTransactionID: String
    var acsHTML: String?
    var acsHTMLRefresh: String?
    var acsUIType: STDSACSUIType
    var challengeCompletionIndicator: Bool
    var challengeInfoHeader: String?
    var challengeInfoLabel: String?
    var challengeInfoText: String?
    var challengeAdditionalInfoText: String?
    var showChallengeInfoTextIndicator: Bool
    var challengeSelectInfo: [STDSChallengeResponseSelectionInfo]?
    var expandInfoLabel: String?
    var expandInfoText: String?
    var issuerImage: STDSChallengeResponseImage?
    var messageExtensions: [STDSChallengeResponseMessageExtension]?
    var messageType: String
    var messageVersion: String
    var oobAppURL: URL?
    var oobAppLabel: String?
    var oobContinueLabel: String?
    var paymentSystemImage: STDSChallengeResponseImage?
    var resendInformationLabel: String?
    var sdkTransactionID: String
    var submitAuthenticationLabel: String?
    var whitelistingInfoText: String?
    var whyInfoLabel: String?
    var whyInfoText: String?
    var transactionStatus: String?

    init(
        threeDSServerTransactionID: String,
        acsCounterACStoSDK: String,
        acsTransactionID: String,
        acsHTML: String?,
        acsUIType: STDSACSUIType,  // Use the enum directly here
        challengeCompletionIndicator: Bool,
        showChallengeInfoTextIndicator: Bool,
        challengeInfoHeader: String?,
        challengeInfoLabel: String?,
        challengeInfoText: String?,
        challengeSelectInfo: [STDSChallengeResponseSelectionInfo],
        expandInfoLabel: String? ,
        expandInfoText: String? ,
     issuerImage: STDSChallengeResponseImage?,
     messageExtensions: [STDSChallengeResponseMessageExtension]?,
     messageType: String?,
     messageVersion: String?,
     oobAppURL: URL?,
      oobContinueLabel: String?,
      paymentSystemImage: STDSChallengeResponseImage?,
      resendInformationLabel: String?,
        submitAuthenticationLabel: String?,
        whitelistingInfoText:  String? ,
        whyInfoLabel: String?,
        whyInfoText: String?
    ) {
        self.threeDSServerTransactionID = threeDSServerTransactionID
        self.acsCounterACStoSDK = acsCounterACStoSDK
        self.acsTransactionID = acsTransactionID
        self.acsHTML = acsHTML
        self.acsUIType = acsUIType  // Directly assign the enum here
        self.challengeCompletionIndicator = challengeCompletionIndicator
        self.showChallengeInfoTextIndicator = showChallengeInfoTextIndicator
        self.challengeInfoHeader = challengeInfoHeader
        self.challengeInfoLabel = challengeInfoLabel
        self.challengeInfoText = challengeInfoText
        self.challengeSelectInfo = challengeSelectInfo
        self.expandInfoLabel = expandInfoLabel
        self.expandInfoText = expandInfoText
        self.issuerImage = issuerImage
        self.messageExtensions = messageExtensions
        self.messageType = messageType ?? ""
        self.messageVersion = messageVersion ?? ""
        self.oobAppURL = oobAppURL
        self.oobContinueLabel = oobContinueLabel
        self.paymentSystemImage = paymentSystemImage
        self.resendInformationLabel = resendInformationLabel
        
        self.submitAuthenticationLabel = submitAuthenticationLabel
        self.whitelistingInfoText = whitelistingInfoText
        self.whyInfoLabel = whyInfoLabel
        self.whyInfoText = whyInfoText
        self.messageType = "Challenge"
        self.messageVersion = "2.1.0"
        self.sdkTransactionID = ""
    }
}
