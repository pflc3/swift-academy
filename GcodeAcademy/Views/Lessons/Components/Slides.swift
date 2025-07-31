//
//  Slides.swift
//  GcodeAcademy
//
//  Created by Joshua Fineboy-Mark on 7/30/25.
//

import SwiftUI
import WebKit

struct GoogleSlidesView: UIViewRepresentable {
    let embedURL: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: embedURL)
        uiView.load(request)
    }
}
