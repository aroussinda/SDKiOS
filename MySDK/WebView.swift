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
    let logoImageName: String // Nom du fichier image local

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let bundle = Bundle(for: MySDKManager.self) // No optional binding needed
        //
        if let sdkBundle = Bundle(identifier: "com.example.myAppdssdk") { // Replace with your SDK's bundle ID
            let base64String = convertImageToBase64(named: "logoMSS", in: sdkBundle)
            print("Base64 String: \(base64String ?? "Failed to load image")")
        }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                let jsCode = """
                               document.querySelector('.button.primary').style.backgroundColor = '\(buttonColor)';
                             """
                webView.evaluateJavaScript(jsCode, completionHandler: nil)
            
        }
        return webView
    }

    func convertImageToBase64(named imageName: String, in bundle: Bundle) -> String? {
        if let imagePath = bundle.path(forResource: imageName, ofType: "png"), // Adjust file type
           let image = UIImage(contentsOfFile: imagePath),
           let imageData = image.pngData() {
            return imageData.base64EncodedString()
        }
        return nil
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
