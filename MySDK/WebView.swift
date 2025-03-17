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
        let image = UIImage(named: "logoMSS", in: bundle, with: nil)
        let image2 = UIImage(named: "Logo", in: bundle, with: nil)
        let base64String = image?.pngData()?.base64EncodedString() ?? image?.jpegData(compressionQuality: 1.0)?.base64EncodedString()
        let base64String2 = image2?.pngData()?.base64EncodedString() ?? image2?.jpegData(compressionQuality: 1.0)?.base64EncodedString()
       
        
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                let jsCode = """
                               document.querySelector('.button.primary').style.backgroundColor = '\(buttonColor)';
                               document.querySelector('.logo-ul').style.backgroundImage = 'url(data:image/png;base64,\(base64String ?? "Failed image converter"))';
                               document.querySelector('.logo-bank').style.backgroundImage = 'url(data:image/png;base64,\(base64String2 ?? "Failed image converter"))';
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
