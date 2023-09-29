import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlStr: String?
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = urlStr, let url = URL(string: safeUrl) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}
