//
//  SheetView.swift
//  MySDK
//
//  Created by Sinda Arous on 11/03/2025.
//

import SwiftUI

struct SheetView: View {
    var message: String
    var onClose: () -> Void
 
    var body: some View {
        VStack {
            Text(message)
                .foregroundColor(.red)
                .font(.title)
                .padding()
            
            Button("Close") {
                onClose()
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}


struct SheetViewChallenge: View {
    private let textFieldCustomization = STDSTextFieldCustomization.defaultSettings()
    private let buttonCustomization = STDSButtonCustomization(backgroundColor: .systemBlue, cornerRadius: 8,titleStyle: .uppercase)
    private let textTitleCustomization = STDSLabelCustomization(headingTextColor: .white, headingFont:UIFont.systemFont(ofSize: 17))
    private let textBodyCustomization = STDSLabelCustomization(headingTextColor: .white, headingFont:UIFont.systemFont(ofSize: 12))
    private let selectCustomization = STDSSelectionCustomization.defaultSettings()
    private let navigationCustomization = STDSNavigationBarCustomization.defaultSettings()

    private let footerCustomization = STDSFooterCustomization.defaultSettings()
    private let imageLoader = STDSImageLoader()
    var response: STDSChallengeResponse
    var onClose: () -> Void
  

    var body: some View {
        switch response.acsUIType {
      // case .html:
            
        case .multiSelect:
            MultiSelectChallengeView( response: response ,onClose: onClose)
               
               
            //.navigationBarItems(trailing: Button(navigationCustomization.buttonText))
              
        case .oob:
            oobChallengeView( response: response ,onClose: onClose)
        case .singleSelect:
            SingleSelectChallengeView( response: response ,onClose: onClose)
        case .text:
            TextChallengeView( response: response ,onClose: onClose)
        default:
            // Handle any unexpected cases
            Text("Unhandled STDSACSUIType case")
                .foregroundColor(.red)
            
        }
    }
   
}
