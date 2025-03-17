//
//  WebView.swift
//  MySDK
//
//  Created by Sinda Arous on 14/03/2025.
//

import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    var fileName: String
    var fileType: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
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
