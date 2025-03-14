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
        if let htmlFilePath = Bundle.main.path(forResource: fileName, ofType: fileType) {
            let url = URL(fileURLWithPath: htmlFilePath)
            uiView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        } else {
            print("HTML file not found!")
        }
    }
}
