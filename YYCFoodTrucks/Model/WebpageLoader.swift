//
//  WebpageLoader.swift
//  YYCFoodTrucks
//
//  Created by Bojana on 2020-10-27.
//  Code written by Mohammad Azam 10/24/2019: "Displaying WebView in SwiftUI"
//
//

import SwiftUI
import WebKit
import Foundation

struct Webview: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebview = WKWebView()
        wkWebview.load(request)
        return wkWebview
    }
    
    
    func updateUIView(_ uiView: Webview.UIViewType, context: UIViewRepresentableContext<Webview>) {
        

    }
    
    

    
    
}


