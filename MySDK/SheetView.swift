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
    var challengeResponse: STDSChallengeResponse
    var onClose: () -> Void

    var body: some View {
        VStack {
            Text(challengeResponse.challengeInfoHeader!)  // Assuming `STDSChallengeResponse` has a `message` property
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
