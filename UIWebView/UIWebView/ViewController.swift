//
//  ViewController.swift
//  UIWebView
//
//  Created by out-belyayeva-ma on 30.10.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    
    let webView = UIWebView()
    let toolbar = UIToolbar()
    let nextButton = UIBarButtonItem(barButtonSystemItem: .fastForward, target: self, action: #selector(goForward))
    let undoButton = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(goBack))
    let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
    let aplication = UIApplication.shared
    let activityIndicator = UIActivityIndicatorView(style: .medium)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        
        setWebView()
        setToolbar()
        
        if let url = URL(string: "https://www.google.com/") {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
        
    }
    
    //MARK: UIWebViewDelegate
    
//    private func isAIShouldAnimate() -> Bool {
//        if webView
//    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        aplication.isNetworkActivityIndicatorVisible = true
        nextButton.isEnabled = false
        undoButton.isEnabled = false
        activityIndicator.color = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        activityIndicator.stopAnimating()
        aplication.isNetworkActivityIndicatorVisible = false
        if webView.canGoBack {
            undoButton.isEnabled = true
        } else {
            undoButton.isEnabled = false
        }
        if webView.canGoForward {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        print("shouldStartLoadWith \(request)")
        return true
    }
    
    
    private func setWebView() {
        
        webView.delegate = self
        
        view.addSubview(webView)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func setToolbar() {
        
        let flexSpaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let fixedSpaceButton = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        
        fixedSpaceButton.width = 20.0
        nextButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        undoButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        refreshButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        toolbar.setItems([undoButton, fixedSpaceButton, nextButton, flexSpaceButton, refreshButton], animated: true)
        
        toolbar.barTintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        
        view.addSubview(toolbar)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        toolbar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        toolbar.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc private func goBack() {
        print("goBack")
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc private func goForward() {
        print("goForward")
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @objc private func refresh() {
        print("refresh")
        webView.reload()
    }

}

