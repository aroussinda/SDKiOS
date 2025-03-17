//
//  HTMLChallenge.swift
//  MySDK
//
//  Created by Sinda Arous on 14/03/2025.
//

import SwiftUICore
import SwiftUI

struct SheetViewHTML: View {
    var fileName: String
    var fileType: String
    var onClose: () -> Void
    
    var body: some View {
        VStack {
            WebView(buttonColor: "#FF5733",logoImageName: "Logo")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .cornerRadius(10)
                .padding()
            
            Button("Close") {
                onClose()
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
