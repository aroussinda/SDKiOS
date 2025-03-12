//
//  STDSAnalyticsDelegate.swift
//  3DSExemple
//
//  Created by Sinda Arous on 04/03/2025.
//
import Foundation

@objc protocol STDSAnalyticsDelegate: AnyObject {

    func didReceiveChallengeResponse(withTransactionID transactionID: String, flow type: String)

    func cancelButtonTapped(withTransactionID transactionID: String)

    func otpSubmitButtonTapped(withTransactionID transactionID: String)

    func oobContinueButtonTapped(withTransactionID transactionID: String)

    func oobDidEnterBackground(withTransactionID transactionID: String)

    func oobWillEnterForeground(withTransactionID transactionID: String)
}

