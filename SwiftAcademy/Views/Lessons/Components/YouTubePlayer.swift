// SwiftAcademy Views - YouTubePlayer embed.
// Embeds YouTube videos inside a `WKWebView` for lesson video playback.
// Keeps lightweight HTML wrapper and responsive sizing encapsulated here.
import SwiftUI
import WebKit

struct YouTubePlayer: UIViewRepresentable {
    let videoID: String // The YouTube video ID

    // Create the WKWebView
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.backgroundColor = .clear
        webView.isOpaque = false
        return webView
    }

    // Lead the YouTube video when the view updates
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // HTML to embed a repsonsive YouTUbe video
        let embedHTML = """
            <!DOCTYPE html>
            <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <style>
                    body { margin: 0; background-color: transparent; }
                    .container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; }
                    .container iframe { position: absolute; top:0; left: 0; width: 100%; height: 100%; }
                </style>
            </head>
            <body>
                <div class="container">
                    <iframe width="100%" hieght="100%" src="https://www.youtube.com/embed/\(videoID)"
                        frameborder="0" allowfullscreen></iframe>
                </div>
            </body>
            </html>
        """

        uiView.loadHTMLString(embedHTML, baseURL: nil)
    }
}

#Preview {
    YouTubePlayer(videoID: "zDNaUi2cjv4")
        .padding()
}
