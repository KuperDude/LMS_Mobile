//
//  HTMLStringView.swift
//  LMS_Mobile
//
//  Created by MyBook on 03.07.2024.
//

import WebKit
import SwiftUI

struct HTMLStringView: UIViewRepresentable {
    let htmlContent: String
    @Binding var webViewHeight: CGFloat

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        webView.navigationDelegate = context.coordinator
        webView.backgroundColor = UIColor(Color.theme.background)
        webView.isOpaque = false
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlContent, baseURL: nil)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: HTMLStringView

        init(_ parent: HTMLStringView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.body.scrollHeight") { (result, error) in
                if let height = result as? CGFloat {
                    DispatchQueue.main.async {
                        self.parent.webViewHeight = height
                    }
                }
            }
        }
    }
}

extension UIColor {
    func toHexString() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb: Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format: "#%06x", rgb)
    }
}
