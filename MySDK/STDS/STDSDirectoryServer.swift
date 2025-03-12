//
//  STDSDirectoryServer.swift
//  3DSExemple
//
//  Created by Sinda Arous on 04/03/2025.
//
import Foundation
import UIKit

enum STDSDirectoryServer: String  {

    
    case ulTestRSA = "UL Test RSA"
    case ulTestEC = "UL Test EC"
    case stpTestRSA = "STP Test RSA"
    case stpTestEC = "STP Test EC"
    case amex = "American Express"
    case cartesBancaires = "Cartes Bancaires"
    case discover = "Discover"
    case mastercard = "Mastercard"
    case visa = "Visa"
    case custom = ""
    case unknown = "unknown"
}


let kULTestRSADirectoryServerID = "F055545342"
let kULTestECDirectoryServerID = "F155545342"
let kSTDSTestRSADirectoryServerID = "ul_test"
let kSTDSTestECDirectoryServerID = "ec_test"
let kSTDSAmexDirectoryServerID = "A000000025"
let kSTDSCartesBancairesServerID = "A000000042"
let kSTDSDiscoverDirectoryServerID = "A000000324"
let kSTDSDiscoverDirectoryServerID_2 = "A000000152"
let kSTDSMastercardDirectoryServerID = "A000000004"
let kSTDSVisaDirectoryServerID = "A000000003"

// Returns the typed directory server enum or STDSDirectoryServerUnknown if the directoryServerID is not recognized
 func STDSDirectoryServerForID(directoryServerID: String) -> STDSDirectoryServer {
    switch directoryServerID {
    case kULTestRSADirectoryServerID:
        return .ulTestRSA
    case kULTestECDirectoryServerID:
        return .ulTestEC
    case kSTDSTestRSADirectoryServerID:
        return .stpTestRSA
    case kSTDSTestECDirectoryServerID:
        return .stpTestEC
    case kSTDSAmexDirectoryServerID:
        return .amex
    case kSTDSDiscoverDirectoryServerID, kSTDSDiscoverDirectoryServerID_2:
        return .discover
    case kSTDSMastercardDirectoryServerID:
        return .mastercard
    case kSTDSVisaDirectoryServerID:
        return .visa
    case kSTDSCartesBancairesServerID:
        return .cartesBancaires
    default:
        return .unknown
    }
}

// Returns the directory server ID or nil for STDSDirectoryServerUnknown
 func STDSDirectoryServerIdentifier(directoryServer: STDSDirectoryServer) -> String? {
    switch directoryServer {
    case .ulTestRSA:
        return kULTestRSADirectoryServerID
    case .ulTestEC:
        return kULTestECDirectoryServerID
    case .stpTestRSA:
        return kSTDSTestRSADirectoryServerID
    case .stpTestEC:
        return kSTDSTestECDirectoryServerID
    case .amex:
        return kSTDSAmexDirectoryServerID
    case .discover:
        return kSTDSDiscoverDirectoryServerID
    case .mastercard:
        return kSTDSMastercardDirectoryServerID
    case .visa:
        return kSTDSVisaDirectoryServerID
    case .cartesBancaires:
        return kSTDSCartesBancairesServerID
    case .custom, .unknown:
        return nil
    }
}

// Returns the directory server image name if one exists
 func STDSDirectoryServerImageName(directoryServer: STDSDirectoryServer) -> String? {
    switch directoryServer {
    case .amex:
        return "amex-logo"
    case .discover:
        return "discover-logo"
    case .mastercard:
        return "mastercard-logo"
    case .cartesBancaires:
        return "cartes-bancaires-logo"
    // Just default to an arbitrary logo for the test servers
    case  .visa:
        if UITraitCollection.current.userInterfaceStyle == .dark {
            return "visa-white-logo"
        }
        return "visa-logo"
    case .custom, .unknown , .ulTestEC, .ulTestRSA, .stpTestRSA, .stpTestEC :
        return nil
    }
}

