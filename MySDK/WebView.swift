//
//  WebView.swift
//  MySDK
//
//  Created by Sinda Arous on 14/03/2025.
//

import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    let buttonColor: String  // Hex color as a string (e.g., "#FF5733")
    //let logoImageName: String // Nom du fichier image local

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                let jsCode = """
                               document.querySelector('.button.primary').style.backgroundColor = '\(buttonColor)';
                               """
                webView.evaluateJavaScript(jsCode, completionHandler: nil)
            }
        
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let bundle = Bundle(for: MySDKManager.self) // No optional binding needed

        if let url = bundle.url(forResource: "acs_challenge", withExtension: "html") {
            print("✅ HTML File Found at: \(url)")
           
            uiView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
            
        } else {
            print("❌ HTML File Not Found!")
        }

    }
}
