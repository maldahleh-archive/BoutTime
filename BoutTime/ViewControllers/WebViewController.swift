//
//  WebViewController.swift
//  BoutTime
//
//  Created by Mohammed Al-Dahleh on 2017-11-23.
//  Copyright © 2017 Mohammed Al-Dahleh. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    var webView: WKWebView!
    var webURL: String?
    
    override func loadView() {
        let webConfig = WKWebViewConfiguration()
        
        webView = WKWebView(frame: .zero, configuration: webConfig)
        webView.uiDelegate = self
        
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = webURL, let eventUrl = URL(string: url) {
            let webRequest = URLRequest(url: eventUrl)
            webView.load(webRequest)
        } else {
            fatalError("Unable to load URL: \(webURL!)")
        }
    }
}
