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
    @IBOutlet weak var webView: WKWebView!
    
    var webURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.uiDelegate = self
        
        if let url = webURL, let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let eventUrl = URL(string: encodedURL) {
            webView.load(URLRequest(url: eventUrl))
            webView.allowsBackForwardNavigationGestures = true
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
