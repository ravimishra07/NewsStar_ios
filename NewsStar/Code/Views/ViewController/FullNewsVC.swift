//
//  FullNewsVC.swift
//  NewsStar
//
//  Created by Ravi Mishra on 08/12/20.
//

import UIKit
import WebKit

class FullNewsVC: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    var newsUrl = ""
    
    override class func description() -> String {
        "FullNewsVC"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    func setUpView(){
        webView.navigationDelegate = self
        guard let url = URL(string: newsUrl) else{
            return
        }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}
