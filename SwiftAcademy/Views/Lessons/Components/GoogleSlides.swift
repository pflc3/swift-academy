import SwiftUI
import WebKit

/**
 * Embeds Google Slides presentations in a SwiftUI view
 */
struct GoogleSlides: UIViewRepresentable {
    // The URL of the Google Slides presentation to embed
    let embedURL: URL
    
    // Creates the WKWebView that will display the slides
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.backgroundColor = .clear
        webView.isOpaque = false
        return webView
    }
    
    // Loads the Google Slides presentation when the view appears or updates
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: embedURL)
        uiView.load(request)
    }
}

#Preview {
    GoogleSlides(embedURL: URL(string: "https://docs.google.com/presentation/d/1mGTJNUocYB3rweKax4Id0PYb1tHGyAgT3rel3P5eB_8/edit?usp=sharing")!)
        .frame(height: 300)
        .padding()
}
