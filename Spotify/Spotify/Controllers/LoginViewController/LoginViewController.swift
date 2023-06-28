//
//  LoginViewController.swift
//  Spotify
//
//  Created by Ravi Dwivedi on 26/05/23.
//

import UIKit
import WebKit

class LoginViewController: UIViewController {
  
    
    private let webView:WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero,configuration: config)
        return webView
    }()

    public var completionHandler:((Bool) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"
        view.backgroundColor = .systemBackground
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        guard let url  = AuthManager.shared.signInURL else {
            return
        }
        
        if Reachability.isConnectedToNetwork() {
            webView.load(URLRequest(url: url))

        }
        else
        {
           showAlert(title:"No Internet Connection", message:"Please check your Internet Connection", vc: self)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
}

//MARK:- WKNavigationDelegate
extension LoginViewController:WKNavigationDelegate{
    
    func  webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else {
            return
        }
        
        let component = URLComponents(string: url.absoluteString)
        guard let code = component?.queryItems?.first(where: {$0.name == "code"})?.value else{
            return
        }
        webView.isHidden = true
        print("code:\(code)")
        AuthManager.shared.exchangeCodeForToken(code: code) {[weak self] success in
            DispatchQueue.main.async {
                self?.navigationController?.popViewController(animated: true)
                self?.completionHandler?(success)
            }
        }
        
    }
    
}
