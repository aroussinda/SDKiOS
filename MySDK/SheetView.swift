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


struct SheetViewHTML: View {
    private let textFieldCustomization = STDSTextFieldCustomization.defaultSettings()
    private let buttonCustomization = STDSButtonCustomization(backgroundColor: .systemBlue, cornerRadius: 8,titleStyle: .uppercase)
    private let textTitleCustomization = STDSLabelCustomization(headingTextColor: .white, headingFont:UIFont.systemFont(ofSize: 17))
    private let textBodyCustomization = STDSLabelCustomization(headingTextColor: .white, headingFont:UIFont.systemFont(ofSize: 12))
    private let selectCustomization = STDSSelectionCustomization.defaultSettings()
    
    private let footerCustomization = STDSFooterCustomization.defaultSettings()
    private let imageLoader = STDSImageLoader()
    
    var response: STDSChallengeResponse
    var onClose: () -> Void
  

    var body: some View {
        MultiSelectChallengeView( response: response )
        
    }
   
}
